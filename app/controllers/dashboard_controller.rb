class DashboardController < ApplicationController
  def index
    @recent_merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse
  end

  def map
    gon.category = params[:category]
    gon.zip_code = params[:zip_code]

    gon.merchant_array = merchant_array = Merchant.within(10, :origin => @zip_code)

    gon.merchant = merchant_array.first

  end
end
