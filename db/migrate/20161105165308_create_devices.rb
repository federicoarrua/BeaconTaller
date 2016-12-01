class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices,:id=>false do |t|
      t.integer :device_id, :null=>false
      t.string :mail

      t.timestamps null: false
    end
    add_index(:devices ,[:device_id],:unique => true)
  end
end
