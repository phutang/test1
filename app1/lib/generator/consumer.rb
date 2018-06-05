module Generator
  class Consumer

    def perform
      seed = random_seed
      if seed
        Fruit.create!(seed: seed)
        seed.update_attribute(:consumed, true)
      end
    end

    def random_seed
      old_seed_number = Seed.using(:app1).ready.count
      seed_number = Seed.available.count
      seed_pos = rand(1..(old_seed_number + seed_number))
      return if seed_pos.nil?

      if seed_pos <= old_seed_number
        old_seed = Seed.using(:app1).ready.offset(seed_pos - 1).first
        move_seed(old_seed)
      else
        Seed.available.offset(seed_pos - old_seed_number - 1).first
      end
    end

    def move_seed(old_seed)
      new_seed = Seed.create!(label: old_seed.label,
                              created_at: old_seed.created_at,
                              updated_at: old_seed.updated_at)

      old_seed.destroy
      new_seed
    end
  end
end
