class ChangeBioMerchantProfiles < ActiveRecord::Migration
  def change
    change_column :merchant_profiles, :bio, :text
  end

end
