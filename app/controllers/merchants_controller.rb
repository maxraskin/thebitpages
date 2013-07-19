class MerchantsController < ApplicationController
  def index
  end

  def show
    @merchants = Merchant.where(:id => params[:id])
    gon.merchants = @merchants
    gon.merchant = @merchant = @merchants.first
  end

  def profile
    @merchant = current_merchant
    gon.merchant = @merchant
  end

  def update
  end
end