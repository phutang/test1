module Jobs
  class CronJob

    class << self
      def start
        Sidekiq.schedule = File.join(Rails.root, 'config', 'schedule.yml')
        Sidekiq::Scheduler.reload_schedule!
      end
    end

  end
end
