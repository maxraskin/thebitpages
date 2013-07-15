class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :integer
    add_column :users, :bitcoin_address, :string
    add_column :users, :twitter, :string
    add_column :users, :phone, :string
    add_column :users, :company_affiliation, :string
    add_column :users, :industry, :string
    add_column :users, :job_title, :string
  end
end
