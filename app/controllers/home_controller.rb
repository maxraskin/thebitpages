class HomeController < ApplicationController
  
  def index
    @recent_merchants = MerchantProfile.last(3).reverse
    offset = rand(MerchantProfile.count)
    gon.merchant = rand_merchant = MerchantProfile.first(:offset => offset)

    gon.merchants = @merchant_array = MerchantProfile.within(10, :origin => rand_merchant)

  end
end
