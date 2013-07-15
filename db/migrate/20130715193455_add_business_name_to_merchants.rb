class AddBusinessNameToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :name, :string
    add_column :merchants, :bname, :string
  end
end
