class AddLatAndLonToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :lat, :string
    add_column :catalogs, :lon, :string
  end
end
