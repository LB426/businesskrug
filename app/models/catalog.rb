class Catalog < ActiveRecord::Base
  belongs_to :user
  serialize :sss
  #validates :name,:locality,:addr,:phone,:email,:description,:biztype, presence: true
  #validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => ": неправильный формат" }
  has_many :catalogimgs, :dependent => :destroy
  accepts_nested_attributes_for :catalogimgs, :allow_destroy => true
  has_many :particles, :dependent => :destroy
end
