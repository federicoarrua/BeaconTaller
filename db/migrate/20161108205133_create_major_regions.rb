class CreateMajorRegions < ActiveRecord::Migration
  def change
    create_table :major_regions,:id=>false do |t|
      t.integer :major_id , :null => false
      t.integer :user_id , :null => false
      t.text :description

      t.timestamps null: false
    end
    add_index(:major_regions ,[:major_id],:unique => true)
  end
end
