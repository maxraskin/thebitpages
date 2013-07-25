class AddLatitudeAndLongitudeToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :latitude, :float
    add_column :merchant_profiles, :longitude, :float
  end
end
