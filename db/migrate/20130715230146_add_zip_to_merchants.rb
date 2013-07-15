class AddZipToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :zip_code, :integer
  end
end
