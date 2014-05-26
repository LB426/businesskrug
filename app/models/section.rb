class Section < ActiveRecord::Base
  has_many :subsections, :dependent => :destroy
  validates :name, presence: true
  validates :name, :uniqueness => true
end
