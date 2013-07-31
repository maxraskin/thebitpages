module DashboardHelper

  def valid_zipcode?(zip_code)
    zip_code.to_s
    if zip_code.length == 5 && zip_code.to_i != 0 && zip_code.to_i.to_s.length >= 4
      true
    else
      false
    end
  end

  def set_current_user
    if current_merchant_profile.present?
      gon.current_user = current_merchant_profile
      @user = current_merchant_profile.merchant
    elsif current_user.present?
      gon.current_user = current_user
      @user = current_user
    end
  end

  def set_zip_code_and_industry 
    if params[:zip_code].first == "0"
      gon.zip_code = Geocoder.coordinates(params[:zip_code])
    else
      gon.zip_code = params[:zip_code]
    end
    gon.industry = params[:category]
  end
end
