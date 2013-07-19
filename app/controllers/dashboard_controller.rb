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

    gon.merchants = @merchants      

    if params[:merchant_map]
      center = rand(@merchants.length)
      gon.merchant = @merchants[center] 
    elsif params[:submit_search]
      @new_members = User.last(3).reverse
      gon.merchants = @merchants
      render "search"
    end
  end

  def search
  end
end
