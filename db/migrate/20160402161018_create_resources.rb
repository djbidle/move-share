class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.boolean :packing
      t.boolean :moving
      t.boolean :rickshaw
      t.boolean :car
      t.boolean :van
      t.boolean :truck
      t.boolean :semi
      t.integer :mask
      t.integer :workorder_id
      t.integer :servicearea_id

      t.timestamps null: false
    end
  end
end
