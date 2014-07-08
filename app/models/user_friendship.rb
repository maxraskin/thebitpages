class UserFriendship < ActiveRecord::Base
  attr_accessible :user_friend_id, :user_id

  belongs_to :user
  belongs_to :user_friend, :class_name => "User"
  validates_uniqueness_of :user_friend_id
end
