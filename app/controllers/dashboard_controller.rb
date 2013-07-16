class DashboardController < ApplicationController
  def index
    @recent_merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse
  end

  def map
    gon.category = @category = params[:category]
    gon.zip_code = @zip_code = params[:zip_code]
  end
end
