class AddBioToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :bio, :text
  end
end
