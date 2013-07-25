class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    # @merchants = Merchant.where(:id => params[:id])
    # gon.merchants = @merchants
    # gon.merchant = @merchant = @merchants.first
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