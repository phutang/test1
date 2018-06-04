# class MigrationWorker
#   include Sidekiq::Worker
#   sidekiq_options retry: false

#   def perform
#     # connection = ActiveRecord::Base.establish_connection('postgres://localhost:5432/app_development').connection

#     Seed.find_in_batches(batch_size: 5000) do |seeds|
#       values = seeds.map do |seed|
#         "(#{seed.id},'#{seed.label}',#{seed.consumed},'#{seed.created_at}','#{seed.updated_at}')"
#       end.join(',')
#       p values
#       sql = "INSERT INTO seeds (id, label, consumed, created_at, updated_at) VALUES #{values}"
#       # connection.execute(sql)
#     end
#   end
# end
