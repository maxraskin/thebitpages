class MerchantFriendship < ActiveRecord::Base
  attr_accessible :merchant_friend_id, :merchant_id

  belongs_to :merchant
  belongs_to :merchant_friend, :class_name => "Merchant"
end
