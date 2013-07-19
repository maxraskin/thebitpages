class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :avatar_cache, :remove_avatar, :bio, :zip_code, :bitcoin_address, :twitter, :phone, :company_affiliation, :industry, :job_title
  # attr_accessible :title, :body

  has_many :user_friendships
  has_many :user_friends, :through => :user_friendships
end
