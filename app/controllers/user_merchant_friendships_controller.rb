class UserMerchantFriendshipsController < ApplicationController

  def index
    @user = current_user
  end
  
  def create
    @friendship = current_user.user_merchant_friendships.build(:merchant_id => params[:merchant_id])
    if @friendship.save
      redirect_to users_url
    end
  end

  def destroy
    @friendship = current_user.user_merchant_friendships.find(params[:id])
    @friendship.destroy
    redirect_to network_url
  end
end
