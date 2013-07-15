require 'spec_helper'

describe User do
  # pending
  # test validation
  # context "if the user is a newly registering" do
  #   before { subject.stub(:quick_registration?) { true }}
  #   it { should validate_presence_of(:name) }
  #   it { should_not validate_presence_of(:age) }
  # end

  #test user creation
  context "get_user_matches method when matching users using the age preference" do
    it "should give me the correct array of matching users given the following ages" do
      user1 = User.make!
      user2 = User.make!

      expect(User.count).to eq(2)

      expect(User.all).to match_array([user1, user2])

    end

    # it "should give me the correct array of matching users given the following ages" do
    #   user1 = User.make!
    #   user2 = User.make!
    #   user3 = User.make!
    #   user4 = User.make!
    #   user5 = User.make!

    #   expect(User.all).to match_array([
    #     user2, user4, user5
    #   ])
    # end
  end
end
