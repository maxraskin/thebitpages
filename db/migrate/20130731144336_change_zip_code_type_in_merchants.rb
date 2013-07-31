class ChangeZipCodeTypeInMerchants < ActiveRecord::Migration
  def change
    change_column :merchants, :zip_code, :string
    change_column :merchant_profiles, :zip_code, :string
    change_column :users, :zip_code, :string
  end

end
