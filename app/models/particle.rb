class Particle < ActiveRecord::Base
  belongs_to :catalog
  has_many :item, :dependent => :destroy
  validates :name, presence: true
end
