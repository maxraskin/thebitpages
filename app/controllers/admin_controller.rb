class AdminController < ApplicationController
  before_filter :admin_auth
  def index
    @merchant_profiles = MerchantProfile.where(:approved => false)
  end

  def admin_auth
    unless current_user.admin?
      redirect_to root_url  
    end
  end

end
