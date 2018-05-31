class ConsumerWorker
  include Sidekiq::Worker

  def perform
    Generator::Consumer.new.perform
  end
end
