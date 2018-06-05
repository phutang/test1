module Generator
  class Consumer

    def perform
      seed = random_seed
      Fruit.create!(seed: seed)
      seed.update_attribute(:consumed, true)
    end

    private

    def random_seed
      old_seed_number = Seed.using(:app2).ready.count
      seed_number = Seed.available.count
      seed_pos = rand(1..(old_seed_number + seed_number))
      if seed_pos <= old_seed_number
        seed = Seed.using(:app2).ready.offset(seed_pos - 1).limit(1)
        move_seed(seed)
      else
        Seed.available.offset(seed_pos - old_seed_number - 1).limit(1)
      end
    end

    def move_seed(seed)
      new_seed = Seed.create!(label: seed.label,
                              created_at: seed.created_at,
                              updated_at: seed.updated_at)

      seed.destroy
      new_seed
    end
  end
end
