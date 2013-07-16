class DashboardController < ApplicationController
  def index
    if current_user.present?
      # @recent_merchants = Merchant.find(:all, :order => "id desc", :limit => 4)
      @recent_merchants = Merchant.last(4).reverse
      @new_members = User.last(3).reverse
    elsif current_merchant.present?

    end
  end
end
