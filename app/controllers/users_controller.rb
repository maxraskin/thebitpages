class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @number_of_friendships = User.number_of_friendships(@user)
    gon.user = @user
  end

  def update
  end
end
