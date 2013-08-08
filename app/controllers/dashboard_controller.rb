class DashboardController < ApplicationController
  include DashboardHelper
  def index
    @merchants = Merchant.latest.paginate(:page => params[:merchant_page], :per_page => 5)
    @new_members = User.latest.paginate(:page => params[:user_page], :per_page => 3)

    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @number_of_friendships = Merchant.number_of_friendships(current_merchant_profile.merchant).to_s
    elsif current_user.present?
      gon.current_user = current_user
      @number_of_friendships = User.number_of_friendships(current_user)
    end
  end

  def map
    set_current_user
    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @number_of_friendships = Merchant.number_of_friendships(current_merchant_profile.merchant).to_s
    elsif current_user.present?
      gon.current_user = current_user
      @number_of_friendships = User.number_of_friendships(current_user)
    end

    if params[:user_search_link]
      @merchants = Merchant.last(4).reverse
      @new_members = User.alphabetically
      render "search"
    elsif params[:user_search_button]
      @merchants = Merchant.last(4).reverse
      @new_members = User.alphabetically.where("name ILIKE?", "%"+"#{params[:user_name]}"+"%")
      render "search"
    elsif !params[:zip_code].present? && params[:category].present? && params[:submit_search]
      @merchants = Merchant.alphabetically.where("industry ILIKE?", "%"+"#{params[:category]}"+"%")
      gon.merchants = @merchants
      @new_members = User.last(3).reverse
      render "search"
    elsif !params[:zip_code].present? && !params[:category].present? && params[:submit_search]
      @merchants = Merchant.alphabetically
      @new_members = User.last(3).reverse
      render "search"
    elsif !valid_zipcode?(params[:zip_code])
      flash.alert = "Invalid Zip Code."
      redirect_to root_url
    else
      set_zip_code_and_industry
      begin 
        if gon.industry.present?
          merchant_industry_array = Merchant.alphabetically.where("industry ILIKE?", "%"+"#{gon.industry}"+"%")
          @merchants = merchant_industry_array.within(10, :origin => gon.zip_code)
          @new_members = User.last(3).reverse
        else
          @merchants = Merchant.within(10, :origin => gon.zip_code)
        end
      rescue Geokit::Geocoders::GeocodeError
        flash.alert = "Invalid Zip Code."
        redirect_to root_url
      end

      if @merchants.present? && !@merchants.empty?
        if params[:merchant_map]
          gon.center = Geocoder::Calculations.geographic_center(@merchants)
        elsif params[:submit_search]
          @new_members = User.last(3).reverse
          gon.merchants = @merchants
          
          if current_merchant_profile.present? == false && current_user.present? == false
            gon.center = Geocoder::Calculations.geographic_center(@merchants)
            render "unregistered_search"
          else
            render "search"
          end
        end
      else
        flash.alert = "No matches found."
        redirect_to root_url
      end
      gon.merchants = @merchants 
    end

  end

  def network
    set_current_user
    set_current_user_followers(@user)
  end

  def search
    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @number_of_friendships = Merchant.number_of_friendships(current_merchant_profile.merchant).to_s
    elsif current_user.present?
      gon.current_user = current_user
      @number_of_friendships = User.number_of_friendships(current_user)
    end
  end

end
