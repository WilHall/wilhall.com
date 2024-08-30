require "sidekiq-scheduler"

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch("REDIS_SIDEKIQ_URL")
  }

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../../config/scheduler.yml', __FILE__))
    Sidekiq::Scheduler.load_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch("REDIS_SIDEKIQ_URL")
  }

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../../config/scheduler.yml', __FILE__))
    Sidekiq::Scheduler.load_schedule!
  end
end