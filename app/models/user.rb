class User < ActiveRecord::Base
  scope :alphabetically, order("name ASC")
  scope :latest, order("created_at DESC")
  
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :avatar_cache, :remove_avatar, :bio, :zip_code, :bitcoin_address, :twitter, :phone, :company_affiliation, :industry, :job_title
  # attr_accessible :title, :body

  has_many :user_friendships, :dependent => :destroy
  has_many :user_friends, :through => :user_friendships

  has_many :user_merchant_friendships, :dependent => :destroy
  has_many :merchants, :through => :user_merchant_friendships

  acts_as_messageable

  USER_CATEGORIES = ["", "Athletics", "Arts \& Entertainment", "Automotive", "Beauty \& Spas", "Education", "Event Planning \& Services", "Financial Services", "Food", "Health \& Medical", "Home Services", "Hotels \& Travel", "Media", "Nightlife", "Pets" "Professional Services", "Public Services \& Government", "Real Estate", "Religious Organizations", "Restaurants", "Shopping", "Other"]

  def mailboxer_name
    name
  end

  def mailboxer_email(object)
    email
  end

  def self.number_of_friendships(user)
    this_user_follow_other_users = UserFriendship.where(:user_id => user.id)
    other_users_follow_this_user = UserFriendship.where(:user_friend_id => user.id)

    this_user_follow_other_merchants = UserMerchantFriendship.where(:user_id => user.id)    
    other_merchants_follow_this_user = MerchantUserFriendship.where(:user_id => user.id)

    total = this_user_follow_other_users.count + other_users_follow_this_user.count + this_user_follow_other_merchants.count + other_merchants_follow_this_user.count
    return total
  end

end
