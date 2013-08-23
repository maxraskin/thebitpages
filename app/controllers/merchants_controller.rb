class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.alphabetically.paginate(:page => params[:merchant_page], :per_page => 10)
  end

  def show
    begin
      @merchant = Merchant.find(params[:id])
      @number_of_friendships = Merchant.number_of_friendships(@merchant)
      gon.merchants = @merchants = [@merchant]
      gon.merchant = @merchant
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "That page doesn't exist!"
      redirect_to root_url
    end
  end

  def profile
    @merchant = current_merchant
    gon.merchant = @merchant
  end

  def update
  end
end