class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :name , :null => false
      t.integer :major_region_id , :null => false
      t.integer :minor_region_id , :null => false
      t.integer :user_id , :null => false
      t.text :description
      t.float :lat
    	t.float :lng

      t.timestamps null: false
    end
    add_index(:beacons ,[:major_region_id,:minor_region_id],:unique => true)
  end
end
