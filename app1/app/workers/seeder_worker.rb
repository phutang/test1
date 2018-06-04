class SeederWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Generator::Seeder.new.perform
  end
end
