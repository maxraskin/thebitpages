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

  has_many :merchant_user_friendships
  has_many :users, :through => :merchant_user_friendships

  has_one :merchant_profile, :dependent => :destroy

  def geocode_method
    "#{self.street_address} #{self.city} #{self.state} #{self.zip_code}"
  end

  def self.number_of_friendships(merchant)
    this_merchant_follow_other_merchants = MerchantFriendship.where(:merchant_id => merchant.id)
    other_merchants_follow_this_merchant = MerchantFriendship.where(:merchant_friend_id => merchant.id)

    this_merchant_follow_other_users = MerchantUserFriendship.where(:merchant_id => merchant.id)
    other_users_follow_this_merchant = UserMerchantFriendship.where(:merchant_id => merchant.id)

    total = this_merchant_follow_other_merchants.count + other_merchants_follow_this_merchant.count + this_merchant_follow_other_users.count + other_users_follow_this_merchant.count
    return total
  end


end
