class UserFriendshipsController < ApplicationController

  def index
    @user = current_user
  end
  def create
    @friendship = current_user.user_friendships.build(:user_friend_id => params[:user_friend_id])
    if @friendship.save
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.user_friendships.find(params[:id])
    @friendship.destroy
    redirect_to current_user
  end
end
