class HeartbeatMailer < ApplicationMailer
  def heartbeat
    mail(from: Rails.configuration.email[:from_address], to: Rails.configuration.email[:from_address], subject: "Heartbeat")
  end
end
