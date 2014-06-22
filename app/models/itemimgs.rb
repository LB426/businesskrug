class Itemimgs < ActiveRecord::Base
  belongs_to :item
  has_attached_file :picture,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => ":rails_root/public/pics/catalogimgs/:id/:style/:basename.:extension",
                    :url  => "/pics/catalogimgs/:id/:style/:basename.:extension",
                    :default_url => "/images/avatar-missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
