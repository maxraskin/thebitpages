class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchants = Merchant.where(:id => params[:id])
    @merchant = @merchants.first
    gon.merchants = @merchants
    gon.merchant = @merchant = @merchants.first
    # binding.pry
  end

  def profile
    @merchant = current_merchant
    gon.merchant = @merchant
  end

  def update
  end
end