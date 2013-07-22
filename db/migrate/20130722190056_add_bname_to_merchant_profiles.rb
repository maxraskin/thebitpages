class AddBnameToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :bname, :string
  end
end
