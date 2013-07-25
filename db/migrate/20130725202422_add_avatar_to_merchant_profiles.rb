class AddAvatarToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :avatar, :string
  end
end
