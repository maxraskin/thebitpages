class MerchantFriendshipsController < ApplicationController

  def index
    @merchant = current_merchant
  end
  
  def create
    @friendship = current_merchant.merchant_friendships.build(:merchant_friend_id => params[:merchant_friend_id])
    if @friendship.save
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_merchant.merchant_friendships.find(params[:id])
    @friendship.destroy
    redirect_to current_merchant
  end
end