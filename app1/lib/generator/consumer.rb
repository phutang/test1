module Generator
  class Consumer

    def perform
      seed = Seed.available.random_records(1).first
      if seed
        Fruit.create!(seed: seed)
        seed.update_attribute(:consumed, true)
      end
    end

  end
end
