Sidekiq.configure_server do |config|
  config.redis = { size: Settings.sidekiq.server_size, url: Settings.redis.url }

  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../schedule.yml', __FILE__))
    Sidekiq::Scheduler.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { size: Settings.sidekiq.client_size, url: Settings.redis.url }
end

Sidekiq::Extensions.enable_delay!
