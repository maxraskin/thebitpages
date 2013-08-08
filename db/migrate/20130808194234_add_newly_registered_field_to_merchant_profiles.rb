class AddNewlyRegisteredFieldToMerchantProfiles < ActiveRecord::Migration
  def up
    add_column :merchant_profiles, :newly_registered, :boolean, :default => :true
  end

  def down
    remove_column :merchant_profiles, :newly_registered
  end
end
