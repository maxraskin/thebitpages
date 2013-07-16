class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    gon.user = @user
  end

  def update
  end
end
