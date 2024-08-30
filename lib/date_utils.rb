class DateUtils

  def self.working_hours_in_a_day
    7.25
  end

  def self.quarter_date_ranges(year)
    reference_date = Date.new(year, 1, 1)
    ((reference_date.beginning_of_year)..reference_date.end_of_year).map(&:all_quarter).uniq
  end

  def self.quarter_start_dates(year)
    reference_date = Date.new(year, 1, 1)
    ((reference_date.beginning_of_year)..reference_date.end_of_year).map(&:beginning_of_quarter).uniq
  end

  def self.quarter_end_dates(year)
    reference_date = Date.new(year, 1, 1)
    ((reference_date.beginning_of_year)..reference_date.end_of_year).map(&:end_of_quarter).uniq
  end
end