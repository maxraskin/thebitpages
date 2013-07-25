class AddNameToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :name, :string
  end
end
