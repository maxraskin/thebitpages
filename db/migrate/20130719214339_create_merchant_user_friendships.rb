class CreateMerchantUserFriendships < ActiveRecord::Migration
  def change
    create_table :merchant_user_friendships do |t|
      t.integer :merchant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
