class MerchantProfilesController < Devise::RegistrationsController
  def index
  end

  def new
    @merchant = Merchant.find(params[:merchant][:id])
    super
  end

  def update
    binding.pry
    # redirect_to merchant_profiles_path
  end
end
