class CreateDiscovers < ActiveRecord::Migration
  def change
    create_table :discovers do |t|
      t.integer :device_id, :null => false
      t.integer :beacon_id, :null => false
      t.timestamp :discover_time

      t.timestamps null: false
    end
  end
end
