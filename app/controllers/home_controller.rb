class HomeController < ApplicationController
  
  def index
    @recent_merchants = Merchant.last(3).reverse
    offset = rand(Merchant.count)
    gon.merchant = rand_merchant = Merchant.first(:offset => offset)

    gon.merchant_array = @merchant_array = Merchant.within(5, :origin => rand_merchant)

  end
end
