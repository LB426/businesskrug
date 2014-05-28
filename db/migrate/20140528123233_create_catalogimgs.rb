class CreateCatalogimgs < ActiveRecord::Migration
  def change
    create_table :catalogimgs do |t|
      t.integer :catalog_id
      t.text :description

      t.timestamps
    end
  end
end
