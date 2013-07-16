require 'spec_helper'

describe Merchant do

 before do
  @merchant1 = Merchant.make!(:street_address => "738 10th ave.", 
                             :city => "New York,",
                             :state => "NY",
                             :zip_code => "10036")

    @merchant2 = Merchant.make!(:street_address => "370 W 52nd St.", 
                               :city => "New York,",
                               :state => "NY",
                               :zip_code => "10036")

    @merchant3 = Merchant.make!(:street_address => "329 W 49th St.", 
                               :city => "New York,",
                               :state => "NY",
                               :zip_code => "10036")

    @merchant4 = Merchant.make!(:street_address => "327 W 42nd St.", 
                               :city => "New York,",
                               :state => "NY",
                               :zip_code => "10036")

    @merchant5 = Merchant.make!(:street_address => "1451 Broadway", 
                               :city => "New York,",
                               :state => "NY",
                               :zip_code => "10036")

    @merchant6 = Merchant.make!(:street_address => "675 9th Ave.", 
                               :city => "New York,",
                               :state => "NY",
                               :zip_code => "10036")

    @merchant7 = Merchant.make!(:street_address => "Bennelong Point", 
                                :city => "Sydney", 
                                  :state => "New South Wales",
                                :zip_code => 2000)
 end



  it "should give me the complete array of all Merchants" do
    

    expect(Merchant.count).to eq(7)
    expect(Merchant.all).to match_array([@merchant1, @merchant2, @merchant3,
                                         @merchant4, @merchant5, @merchant6,
                                         @merchant7])
  end
  
  it "should give me the correct array of Merchants, given a specified origin" do
    expect(Merchant.within(5, :origin => @merchant1)).to match_array([@merchant1, @merchant2, @merchant3,
                                         @merchant4, @merchant5, @merchant6])

    expect(Merchant.within(1, :origin => @merchant7)).to match_array([@merchant7])
  end

end
