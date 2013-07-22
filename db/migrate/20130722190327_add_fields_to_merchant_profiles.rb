class AddFieldsToMerchantProfiles < ActiveRecord::Migration
  def change
    add_column :merchant_profiles, :bio, :string
    add_column :merchant_profiles, :street_address, :string
    add_column :merchant_profiles, :state, :string
    add_column :merchant_profiles, :city, :string
    add_column :merchant_profiles, :zip_code, :integer
    add_column :merchant_profiles, :bitcoin_address, :string
    add_column :merchant_profiles, :company_website, :string
    add_column :merchant_profiles, :phone, :string
    add_column :merchant_profiles, :company_affiliation, :string
    add_column :merchant_profiles, :industry, :string
    add_column :merchant_profiles, :twitter, :string
  end
end
