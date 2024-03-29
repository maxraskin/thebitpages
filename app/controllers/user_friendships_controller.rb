class UserFriendshipsController < ApplicationController

  def index
    @user = current_user
  end

  def create
    @friendship = current_user.user_friendships.build(:user_friend_id => params[:user_friend_id])
    @friendship.save
    redirect_to network_url
  end

  def destroy
    @friendship = current_user.user_friendships.find(params[:id])
    @friendship.destroy
    redirect_to network_url
  end
end
