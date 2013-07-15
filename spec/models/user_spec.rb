require 'spec_helper'

describe User do

  it "should give me the correct array of matching individual_users" do
    user1 = User.make!
    user2 = User.make!

    expect(User.count).to eq(2)

    expect(User.all).to match_array([user1, user2])

  end

  
end
