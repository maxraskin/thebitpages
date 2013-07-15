class AddAvatarToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :avatar, :string
  end
end
