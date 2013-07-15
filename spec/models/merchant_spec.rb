require 'spec_helper'

describe Merchant do
  it "should give me the correct array of matching merchant_users" do
    merchant1 = Merchant.make!
    merchant2 = Merchant.make!

    expect(Merchant.count).to eq(2)

    expect(Merchant.all).to match_array([merchant1, merchant2])

  end

end
