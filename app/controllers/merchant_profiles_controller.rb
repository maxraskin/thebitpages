class MerchantProfilesController < Devise::RegistrationsController

  def new
    @merchant = Merchant.find(params[:merchant][:id]) if params[:merchant].present?
    super
  end

  def create
    if params[:merchant_profile][:merchant_id].present?
      @merchant = Merchant.find(params[:merchant_profile][:merchant_id])
      @merchant_profile = MerchantProfile.create(params[:merchant_profile])

      @merchant_profile.name = @merchant.name
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
    else
      @merchant_profile = MerchantProfile.create(params[:merchant_profile])
      @merchant = Merchant.new(params[:merchant_profile])
      @merchant.save

      @merchant_profile.merchant = @merchant
      @merchant.merchant_profile = @merchant_profile

      @merchant_profile.save
    end

    redirect_to merchant_path(@merchant)
  end

  def update
    merchant = current_merchant_profile.merchant
    merchant.industry = params[:merchant_profile][:industry]
    merchant.street_address = params[:merchant_profile][:street_address]
    merchant.state = params[:merchant_profile][:state]
    merchant.city = params[:merchant_profile][:city]
    merchant.zip_code = params[:merchant_profile][:zip_code]
    merchant.save
    super
  end
end


