class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :bname, :avatar, :avatar_cache, :remove_avatar, :bio, :street_address, :city, :state, :zip_code, :online_business, :bitcoin_address, :company_website, :phone, :company_affiliation, :industry, :twitter

  mount_uploader :avatar, AvatarUploader
  
  geocoded_by :geocode_method
  
  after_validation :geocode

  acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :merchant_friendships
  has_many :merchant_friends, :through => :merchant_friendships

  def geocode_method
    "#{self.street_address} #{self.city} #{self.state} #{self.zip_code}"
  end
end
