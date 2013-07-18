class DashboardController < ApplicationController
  def index
    @recent_merchants = Merchant.last(4).reverse
    @new_members = User.last(3).reverse

  end

  def map
    gon.industry = @industry = params[:category]
    gon.zip_code = zip_code = params[:zip_code]

    if @industry.present?
      merchant_industry_array =  Merchant.where("lower(industry) = ?", @industry.downcase)
      @merchant_array = merchant_industry_array.within(8, :origin => zip_code)
    else
      @merchant_array = Merchant.within(8, :origin => zip_code)
    end      

    gon.merchant_array = @merchant_array

    center = rand(@merchant_array.length)
    gon.merchant = @merchant_array[center]

  end
end
