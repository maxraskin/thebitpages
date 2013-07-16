class DashboardController < ApplicationController
  def index
    @recent_merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse
  end
end
