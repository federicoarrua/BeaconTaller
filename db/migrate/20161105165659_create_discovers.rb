class CreateDiscovers < ActiveRecord::Migration
  def change
    create_table :discovers do |t|
      t.integer :device_id, :null => false
      t.integer :beacon_id, :null => false
      t.integer :major_id, :null => false
      t.integer :minor_id, :null => false
      t.string :discover_time

      t.timestamps null: false
    end
  end
end
