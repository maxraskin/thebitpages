class HomeController < ApplicationController
  # before_filter :custom_auth!
  def index
    @recent_merchants = Merchant.last(3).reverse
    offset = rand(Merchant.count)
    gon.merchant = rand_record = Merchant.first(:offset => offset)
  end
end
