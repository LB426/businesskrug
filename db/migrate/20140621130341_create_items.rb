class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :particle_id, :null => false
      t.string :name
      t.text :spec

      t.timestamps
    end
  end
end
