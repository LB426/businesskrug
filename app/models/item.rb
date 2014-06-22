class Item < ActiveRecord::Base
  belongs_to :particle
  has_many :itemimgs, :dependent => :destroy
  accepts_nested_attributes_for :itemimgs, :allow_destroy => true
end
