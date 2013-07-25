class DashboardController < ApplicationController
  def index
    @merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse

    if current_merchant.present?
      gon.current_user = current_merchant
    #   @qr = RQRCode::QRCode.new("#{current_merchant.bitcoin_address}", :size => 8, :level => :l)
    else
      gon.current_user = current_user
      # @qr = RQRCode::QRCode.new("#{current_user.bitcoin_address}", :size => 8, :level => :l)
    end
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
    elsif current_merchant_profile.present?
      @user = current_merchant_profile.merchant
    end

  end

  def search
    @merchants = Merchant.all
  end
end
