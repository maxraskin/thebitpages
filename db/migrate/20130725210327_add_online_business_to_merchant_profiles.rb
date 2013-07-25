class AddOnlineBusinessToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :online_business, :boolean
  end
end
