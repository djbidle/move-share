class CreateServiceareas < ActiveRecord::Migration
  def change
    create_table :serviceareas do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :radius
      t.integer :move_distance
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
