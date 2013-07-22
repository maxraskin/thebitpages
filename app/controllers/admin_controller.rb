class AdminController < ApplicationController
  before_filter :admin_auth
  def index
    
  end

  def admin_auth
    unless current_user.admin?
      redirect_to root_url  
    end
  end

end
