class AddMoreFieldsToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :street_address, :string
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
    add_column :merchants, :online_business, :boolean
    add_column :merchants, :bitcoin_address, :string
    add_column :merchants, :company_website, :string
    add_column :merchants, :phone, :string
    add_column :merchants, :company_affiliation, :string
    add_column :merchants, :industry, :string
    add_column :merchants, :twitter, :string
  end
end
