require 'spec_helper'

describe DashboardHelper do

  before do
    @u1 = User.make!
    @u2 = User.make!
    @u3 = User.make!
    @m1 = Merchant.make!    
    @m2 = Merchant.make!
    @m3 = Merchant.make!

    #u1 follows u2 and u3
    @u1.user_friendships.build(:user_friend_id => @u2.id)
    @u1.user_friendships.build(:user_friend_id => @u3.id)
    @u1.save

    #u2 follows u1
    @u2.user_friendships.build(:user_friend_id => @u1.id)
    @u2.save

    #u3 follows u1
    @u3.user_friendships.build(:user_friend_id => @u1.id)
    @u3.save

    # @m1.merchant_user_friendships
    current_merchant = ''
  end

  describe "zip code validation method" do
    
    it "should return true for valid zip codes" do
      expect(valid_zipcode?("11229")).to be(true)
      expect(valid_zipcode?("01111")).to be(true)
      expect(valid_zipcode?("99999")).to be(true)
    end

    it "should return false for invalid zip codes" do
      expect(valid_zipcode?("00000")).to be(false)
      expect(valid_zipcode?("19191919")).to be(false)
      expect(valid_zipcode?("34")).to be(false)
    end

  end

  describe "set_current_user_followers method" do
    it "should get the correct array of users that are following a given user" do
      current_merchant_profile = false
      set_current_user_followers(@u1)
      u1_user_followers = UserFriendship.where(:user_friend_id => @u1.id)
      expect(@user_followers).to eq(u1_user_followers)
    end
  end
end
