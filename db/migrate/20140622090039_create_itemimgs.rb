class CreateItemimgs < ActiveRecord::Migration
  def change
    create_table :itemimgs do |t|
      t.integer :item_id
      t.text :description

      t.timestamps
    end
  end
end
