class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :locality
      t.string :addr
      t.string :phone
      t.string :email
      t.string :siteurl
      t.text :description
      t.text :biztype
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
