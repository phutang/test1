class CreateFruit < ActiveRecord::Migration[5.2]
  def change
    create_table :fruits do |t|
      t.string       :name
      t.belongs_to   :seed

      t.timestamps
    end
  end
end
