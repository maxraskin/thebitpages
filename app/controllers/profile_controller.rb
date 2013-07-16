class ProfileController < ApplicationController
  def index
    if current_merchant.present?
      gon.merchant = current_merchant
    end

  end
end
