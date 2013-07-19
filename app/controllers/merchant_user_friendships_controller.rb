class MerchantUserFriendshipsController < ApplicationController

  def index
    @merchant = current_merchant
  end
  
  def create
    @friendship = current_merchant.merchant_user_friendships.build(:user_id => params[:user_id])
    if @friendship.save
      redirect_to merchants_url
    end
  end

  def destroy
    @friendship = current_merchant.merchant_user_friendships.find(params[:id])
    @friendship.destroy
    redirect_to network_url
  end

end
