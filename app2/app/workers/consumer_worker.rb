class ConsumerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    Generator::Consumer.new.perform
  end
end
