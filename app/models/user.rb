class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>", :thumb1 => "177x177>" },
                    :path => ":rails_root/public/images/avatars/:id/:style/:basename.:extension",
                    :url  => "/images/avatars/:id/:style/:basename.:extension",
                    :default_url => "/images/avatar-missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(login, password)
    user = find_by(phone: login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else  
      nil
    end
  end

  has_many :catalogs, :dependent => :destroy
  #has_many :filters, :dependent => :destroy
  #has_many :presentations, :through => :catalogs
  #has_many :reviews, :dependent => :destroy

  # проверка на непустое поле
  validates :phone, presence: true
  validates :nick, presence: true
  validates :gender, presence: true
  validates :email, presence: true
  validates :locality, presence: true
  validates :password_open_text, presence: true
  validates :password_open_text, length: { in: 4..20 }

  # проверка на уникальность
  validates :phone, :uniqueness => true
  validates :unique_id, :uniqueness => true
  validates :email, :uniqueness => true
  validates :nick, :uniqueness => true

  def groupadd(group = '')
    groups = self.group + ',' + group
    self.update(group: groups)
  end

  def groupdel(group = '')
    groups = self.group
    groups = groups.gsub(/#{group}/,'')
    groups = groups.gsub(/(\,){2,}/,'')
    groups = groups.gsub(/\,$/,'')
    self.group = groups
    self.update(group: groups)
  end

  def groupcheck
    groups = self.group
    if groups.include? 'registered'
      groups = groups.gsub(/registered/,'newbie')
    end
    if groups[groups.size-1] == ','
      groups.chop! 
    end
    self.group = groups
    self.update(group: groups)
  end
  
end
