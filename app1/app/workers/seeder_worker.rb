class SeederWorker
  include Sidekiq::Worker

  def perform
    Generator::Seeder.new.perform
  end
end
