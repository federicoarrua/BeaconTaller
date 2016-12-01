class CreateMinorRegions < ActiveRecord::Migration
  def change
    create_table :minor_regions, :id => false do |t|
      t.integer :minor_id , :null => false
      t.text :description

      t.timestamps null: false
    end
    add_index(:minor_regions ,[:minor_id],:unique => true)
  end
end
