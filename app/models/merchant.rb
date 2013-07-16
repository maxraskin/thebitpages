class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :bname, :avatar, :avatar_cache, :remove_avatar, :bio, :street_address, :city, :state, :zip_code, :online_business, :bitcoin_address, :company_website, :phone, :company_affiliation, :industry, :twitter
  # attr_accessible :title, :body

  geocoded_by :geocode_method
  after_validation :geocode

  def geocode_method
    # "#{self.location} #{destination.name}"
    
    "#{self.street_address} #{self.city} #{self.state} #{self.zip_code}"
  end
end
