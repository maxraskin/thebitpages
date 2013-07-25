class MerchantProfilesController < Devise::RegistrationsController
  def index
  end

  def new
    @merchant = Merchant.find(params[:merchant][:id])
    super
  end

  def create
    @merchant = Merchant.find(params[:merchant_profile][:merchant_id])
    # binding.pry
    @merchant_profile = MerchantProfile.create(params[:merchant_profile])

    @merchant_profile.name = @merchant.name
    @merchant_profile.email = @merchant.email
    @merchant_profile.bio = @merchant.bio
    @merchant_profile.street_address = @merchant.street_address
    @merchant_profile.city = @merchant.city
    @merchant_profile.state = @merchant.state
    @merchant_profile.zip_code = @merchant.zip_code
    @merchant_profile.online_business = @merchant.online_business
    @merchant_profile.bitcoin_address = @merchant.bitcoin_address
    @merchant_profile.company_website = @merchant.company_website
    @merchant_profile.industry = @merchant.industry
    @merchant_profile.twitter = @merchant.twitter
    @merchant_profile.latitude = @merchant.latitude
    @merchant_profile.longitude = @merchant.longitude


    @merchant_profile.save
    redirect_to merchant_path(@merchant)
    

  end
end
