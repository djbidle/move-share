class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |t|
      t.string :origin
      t.float :lat
      t.float :lng
      t.string :destination
      t.string :distance_text
      t.float :distance_value
      t.string :duration_text
      t.integer :duration_value
      t.boolean :is_assigned
      t.integer :accepted_by
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
