class AddSecAndSubsecLinkToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogs, :sss, :text
  end
end
