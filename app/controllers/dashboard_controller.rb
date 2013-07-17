class DashboardController < ApplicationController
  def index
    @recent_merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse

  end

  def map
    gon.category = @category = params[:category]
    gon.zip_code = @zip_code = params[:zip_code]

    gon.merchant_array = @merchant_array = Merchant.within(5, :origin => @zip_code)

    center = rand(@merchant_array.length)
    gon.merchant = @merchant_array[center]

  end
end
