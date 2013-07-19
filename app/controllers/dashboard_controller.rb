class DashboardController < ApplicationController
  def index
    @merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse
  end

  def map
    gon.industry = @industry = params[:category]
    gon.zip_code = zip_code = params[:zip_code]

    if @industry.present?
      merchant_industry_array =  Merchant.where("lower(industry) = ?", @industry.downcase)

      @merchants = merchant_industry_array.within(10, :origin => zip_code)
    else
      @merchants = Merchant.within(10, :origin => zip_code)
    end


    if params[:merchant_map]
      center = Geocoder::Calculations.geographic_center(@merchants)
      # gon.merchant = Merchant.closest(:origin => center).first
      gon.center = Geocoder::Calculations.geographic_center(@merchants)
      # binding.pry
    elsif params[:submit_search]
      @new_members = User.last(3).reverse
      gon.merchants = @merchants
      render "search"
    end

    gon.merchants = @merchants      

  end

  def network
    if current_user.present?
      @user = current_user
    elsif current_merchant.present?
      @user = current_merchant
    end
  end

  def search
    @merchants = Merchant.all
  end
end
