class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchants = Merchant.where(:id => params[:id])
    @merchant = @merchants.first
    @number_of_friendships = Merchant.number_of_friendships(@merchant)

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