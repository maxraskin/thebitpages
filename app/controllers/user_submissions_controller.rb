class UserSubmissionsController < ApplicationController

  def index
    @user_submission = UserSubmission.new
  end

  def create
    @user_submission = UserSubmission.create(params[:user_submission])
    @user_submission.save
    redirect_to root_url
  end

end
