class CreateSeed < ActiveRecord::Migration[5.2]
  def change
    create_table :seeds do |t|
      t.string    :label
      t.boolean   :consumed, default: false

      t.timestamps
    end
  end
end
