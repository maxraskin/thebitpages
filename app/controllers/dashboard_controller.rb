class DashboardController < ApplicationController
  def index
    @merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse

    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
    else
      gon.current_user = current_user
    end
  end

  def map
    if params[:zip_code].length != 5 || params[:zip_code].to_i == 0
      flash.notice = "Invalid Zip Code."
      redirect_to root_url
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
        flash.notice = "Invalid Zip Code."
        redirect_to root_url
      end

      if @merchants.present?
        if params[:merchant_map]
          gon.center = Geocoder::Calculations.geographic_center(@merchants)
        elsif params[:submit_search]
          @new_members = User.last(3).reverse
          gon.merchants = @merchants
          render "search"
        end
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
