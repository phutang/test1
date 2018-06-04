class AddAppIdToSeed < ActiveRecord::Migration[5.2]
  def change
    add_column :seeds, :app_id, :integer
  end
end
