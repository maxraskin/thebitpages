class MerchantsController < ApplicationController
  def index
  end

  def show
    @merchant = Merchant.find(params[:id])
    gon.merchant = @merchant
  end

  def profile
    @merchant = current_merchant
    gon.merchant = @merchant
  end

  def update
  end
end
