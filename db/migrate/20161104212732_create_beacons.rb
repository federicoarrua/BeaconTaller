class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :major_id , :null => false
      t.integer :minor_id , :null => false
      t.integer :user_id #, :null => false
      t.text :description
      t.float :lat
    	t.float :lng

      t.timestamps null: false
    end
    add_index(:beacons ,[:major_id,:minor_id],:unique => true)
  end
end
