class AddAttachmentPictureToCatalogimgs < ActiveRecord::Migration
  def self.up
    change_table :catalogimgs do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :catalogimgs, :picture
  end
end
