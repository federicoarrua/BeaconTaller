class CreateDiscovers < ActiveRecord::Migration
  def change
    create_table :discovers do |t|
      t.string :device_id, :null => false
      t.integer :major_id, :null => false
      t.integer :minor_id, :null => false
      t.string :discover_time

      t.timestamps null: false
    end
  end
end
