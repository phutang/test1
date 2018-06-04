namespace :data do
  desc 'Copy all current data to new database'
  task :migrate => :environment do
    last_seed = MainDb.connection.execute('select id from seeds order by id desc limit 1').first
    last_seed_id = 0
    last_seed_id = last_seed['id'] if last_seed

    Seed.find_in_batches(batch_size: 5000) do |seeds|
      values = seeds.map do |seed|
        "(#{last_seed_id + seed.id},'#{seed.label}',#{seed.consumed},'#{seed.created_at}','#{seed.updated_at}', 1)"
      end.join(',')
      sql = "INSERT INTO seeds (id, label, consumed, created_at, updated_at, app_id) VALUES #{values}"
      MainDb.connection.execute(sql)
    end

    Fruit.find_in_batches(batch_size: 5000) do |fruits|
      values = fruits.map do |fruit|
        "('#{fruit.name}',#{last_seed_id + fruit.seed_id},'#{fruit.created_at}','#{fruit.updated_at}')"
      end.join(',')
      sql = "INSERT INTO fruits (name, seed_id, created_at, updated_at) VALUES #{values}"
      MainDb.connection.execute(sql)
    end
  end
end
