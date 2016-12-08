class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices,:id=>false do |t|
      t.string :device_id, :null=>false

      t.timestamps null: false
    end
    add_index(:devices ,[:device_id],:unique => true)
  end
end
