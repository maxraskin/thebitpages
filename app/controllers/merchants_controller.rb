class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.alphabetically.paginate(:page => params[:merchant_page], :per_page => 10)
  end

  def show
    unless params[:id].to_i != 0
      flash[:alert] = "That page doesn't exist!"
      redirect_to root_url
    else
      @merchants = Merchant.where(:id => params[:id])
      @merchant = @merchants.first
      @number_of_friendships = Merchant.number_of_friendships(@merchant)

      gon.merchants = @merchants
      gon.merchant = @merchant = @merchants.first
    end
  end

  def profile
    @merchant = current_merchant
    gon.merchant = @merchant
  end

  def update
  end
end