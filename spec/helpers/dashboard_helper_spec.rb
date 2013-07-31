require 'spec_helper'

describe DashboardHelper do
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
end
