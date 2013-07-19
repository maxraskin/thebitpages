class MerchantUserFriendship < ActiveRecord::Base
  attr_accessible :merchant_id, :user_id

  belongs_to :merchant
  belongs_to :user
end
