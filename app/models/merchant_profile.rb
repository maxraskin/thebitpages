class MerchantProfile < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :merchant_id, :approved, :email, :zip_code, :bname
  belongs_to :merchant

  

  # def active_for_authentication? 
  #   super && approved? 
  # end 

  # def inactive_message 
  #   if !approved? 
  #     :not_approved 
  #   else 
  #     super
  #   end 
  # end
end
