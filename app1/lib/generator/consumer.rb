module Generator
  class Consumer

    def perform
      available_seeds = Seed.available
      if available_seeds.any?
        seed = available_seeds.random_records(1).first
        Fruit.create!(seed: seed)
        seed.update_attribute(:consumed, true)
      end
    end

  end
end
