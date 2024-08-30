class Api::V1::IssuesController < Api::ApplicationController
  def create
    data = params.to_unsafe_h

    Sentry.configure_scope do |scope|
      scope.set_context('params', { params: data })
    end

    case_name = data[:case_name]
    unless case_name.include?("-")
      case_name = "#{Time.current.year}-#{data[:case_name]}"
    end

    submitter = User.where(email: data[:submitter_email])
                    .or(User.where(preferred_email: data[:submitter_email]))
                    .or(User.where(email: data[:submitter_email].downcase))
                    .or(User.where(preferred_email: data[:submitter_email].downcase))
                    .first
    unless submitter.present?
      Sentry.capture_message("Issue creation failed: Submitter not found")
      render json: { "error": "User with email #{data[:submitter_email]} not found" }, status: 404
      return
    end

    if data[:category] == 'Automation Error'
      LinearMailer.log_issue(case_name, data).deliver

      AutomationIssue.create!(
        case_name: case_name,
        production_step_name: data[:production_step],
        submitter: submitter,
        category: data[:category],
        description: data[:description],
        solution: data[:solution],
        occurred_at: Time.current
      )

      render json: {
        message: "Issue tracked and sent to ticketing system"
      }, status: 200
      return
    end

    schedule_step = Rxw::ScheduleStep.joins(:case, :production_step).find_by(case: { case_name: case_name }, production_step: { name: data[:production_step] })
    unless schedule_step.present?
      Sentry.capture_message("Issue creation failed: Case not found")
      render json: { "error": "Case with name #{case_name} not found" }, status: 404
      return
    end

    user = User.find_by_rxw_user_id(schedule_step.started_by_id)
    unless schedule_step.present?
      Sentry.capture_message("Issue creation failed: User not found")
      render json: { "error": "User with id #{schedule_step.started_by_id} not found" }, status: 404
      return
    end

    existing_issue = Issue.where(
      case_name: case_name,
      production_step_name: data[:production_step],
      description: data[:description],
    ).first
    if existing_issue.present?
      Sentry.capture_message("Issue creation failed: Issue already submitted")
      render json: { "error": "Issue already submitted" }, status: 404
      return
    end

    issue = Issue.create!(
      case_name: case_name,
      production_step_name: data[:production_step],
      submitter: submitter,
      user: user,
      category: data[:category],
      description: data[:description],
      solution: data[:solution],
      occurred_at: schedule_step.completions.last&.timestamp || Time.current
    )

    import_step = Rxw::ScheduleStep.joins(:case, :production_step).find_by(case: { case_name: case_name }, production_step: { name: "Digital Import" })
    prep_step = Rxw::ScheduleStep.joins(:case, :production_step).find_by(case: { case_name: case_name }, production_step: { name: "Digital Prep" })

    importer = import_step ? User.find_by_rxw_user_id(import_step.started_by_id) : nil
    prepper = prep_step ? User.find_by_rxw_user_id(prep_step.started_by_id) : nil

    if importer.present? && data[:production_step] == "Digital Import"
      IssueMailer.report_issue(issue, importer).deliver
    elsif prepper.present? && data[:production_step] == "Digital Prep"
      IssueMailer.report_issue(issue, prepper).deliver
    end

    Try.times(5, wait_between: 0.5, on_tries_exhausted: ->(e) { Sentry.capture_exception(e) }) do
      response = Rxw::ApiClient.new_root_client.create_note(
        case_name: case_name,
        note_text: <<-EOL
#{issue.submitter.first_name} #{issue.submitter.last_name} reported an issue with #{issue.production_step_name}.
<br />
<br />
<b>Issue: </b> #{issue.category}<br />
<b>Description: </b> #{issue.description}<br />
<b>Solution: </b> #{issue.solution}<br />
        EOL
      )
      Sentry.configure_scope do |scope|
        scope.set_context('note_response', { response: response.inspect })
      end
      raise "Failed to create note" unless response.success?
    end

    render json: {
      message: "Issue created",
      issue_id: issue.id,
      user_name: "#{issue.user.first_name} #{issue.user.last_name}",
      importer_name: "#{importer&.first_name} #{importer&.last_name}".strip.presence || "Unknown",
      prepper_name: "#{prepper&.first_name} #{prepper&.last_name}".strip.presence || "Unknown",
    }, status: 201
  end
end
