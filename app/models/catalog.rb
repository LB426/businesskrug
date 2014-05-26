class Catalog < ActiveRecord::Base
  belongs_to :user

  #validates :name,:locality,:addr,:phone,:email,:description,:biztype, presence: true
  #validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => I18n.t('default.email_invalid') }
end
