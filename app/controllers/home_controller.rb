class HomeController < ApplicationController
  
  def index
    @recent_merchants = Merchant.last(3).reverse
    offset = rand(Merchant.count)
    gon.merchant = rand_merchant = Merchant.first(:offset => offset)

    gon.merchants = @merchant_array = Merchant.within(10, :origin => rand_merchant)

  end
end
