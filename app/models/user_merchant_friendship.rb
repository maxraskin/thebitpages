class UserMerchantFriendship < ActiveRecord::Base
  attr_accessible :merchant_id, :user_id

  belongs_to :user
  belongs_to :merchant
  validates_uniqueness_of :merchant_id
end
