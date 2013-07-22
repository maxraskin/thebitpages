class AddApprovedToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :approved, :boolean, :default => false, :null => false
    add_index :merchant_profiles, :approved
  end
end
