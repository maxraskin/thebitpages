class DashboardController < ApplicationController
  def index
    @merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse

    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @number_of_friendships = Merchant.number_of_friendships(current_merchant_profile.merchant).to_s
    elsif current_user.present?
      gon.current_user = current_user
      @number_of_friendships = User.number_of_friendships(current_user)
    end
  end

  def map
    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
    else
      gon.current_user = current_user
    end

    if params[:zip_code].length != 5 || params[:zip_code].to_i == 0
      flash.alert = "Invalid Zip Code."
      redirect_to root_url  
    # elsif params[:zip_code].first == "0" #fix geokit error for zip_codes with leading zeros
    #   zip_code = params[:zip_code]
    #   zip_code[0] = ''
    #   zip_code = "%05d" % zip_code
    #   binding.pry
    else
      gon.industry = @industry = params[:category]
      gon.zip_code = zip_code = params[:zip_code] 

      begin 
        if @industry.present?
          merchant_industry_array =  Merchant.where("lower(industry) = ?", @industry.downcase)
          @merchants = merchant_industry_array.within(10, :origin => zip_code)
        else
          @merchants = Merchant.within(10, :origin => zip_code)
        end
      rescue Geokit::Geocoders::GeocodeError
        flash.alert = "Invalid Zip Code."
        redirect_to root_url
      end

      unless @merchants.empty?
        if params[:merchant_map]
          gon.center = Geocoder::Calculations.geographic_center(@merchants)
        elsif params[:submit_search]
          @new_members = User.last(3).reverse
          gon.merchants = @merchants
          render "search"
        end
      else
        flash.alert = "No matches found."
        redirect_to root_url
      end
      gon.merchants = @merchants 
    end
  end

  def network
    if current_user.present?
      @user = current_user
    elsif current_merchant_profile.present?
      @user = current_merchant_profile.merchant
    end
  end

  def search
    @merchants = Merchant.all
  end

end
