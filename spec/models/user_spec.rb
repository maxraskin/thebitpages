require 'spec_helper'

describe User do

  before do
    @user1 = User.make!
    @user2 = User.make!

    @merchant1 = Merchant.make!
    @merchant2 = Merchant.make!
    @merchant3 = Merchant.make!
  end

  it "should give me the correct array of matching individual_users" do
    expect(User.count).to eq(2)
    expect(User.all).to match_array([@user1, @user2])
  end

  it "should get the correct number of friendships" do
    user1_user2_friendship = @user1.user_friendships.build(:user_friend_id => @user2.id)
    user1_user2_friendship.save

    user1_merchant1_friendship = @user1.user_merchant_friendships.build(:merchant_id => @merchant1.id)
    user1_merchant1_friendship.save

    user2_user1_friendship = @user2.user_friendships.build(:user_friend_id => @user1.id)
    user2_user1_friendship.save

    merchant2_user1_friendship = @merchant2.merchant_user_friendships.build(:user_id => @user1.id)
    merchant2_user1_friendship.save

    merchant3_user1_friendship = @merchant3.merchant_user_friendships.build(:user_id => @user1.id)
    merchant3_user1_friendship.save

    expect(User.number_of_friendships(@user1)).to eq(5)

  end

  
end
