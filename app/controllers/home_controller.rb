class HomeController < ApplicationController
  
  def index
    @recent_merchants = Merchant.last(4).reverse
    @merchant_array = Merchant.where("zip_code <> ''")
    offset = rand(@merchant_array.count-1)
    gon.merchant = rand_merchant = @merchant_array.first(:offset => offset)
    gon.merchants = @merchant_array = Merchant.within(10, :origin => rand_merchant)
  end
end
