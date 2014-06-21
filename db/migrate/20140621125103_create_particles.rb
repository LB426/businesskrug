class CreateParticles < ActiveRecord::Migration
  def change
    create_table :particles do |t|
      t.integer :catalog_id, :null => false
      t.string :name

      t.timestamps
    end
  end
end
