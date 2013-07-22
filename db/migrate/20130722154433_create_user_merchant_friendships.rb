class CreateUserMerchantFriendships < ActiveRecord::Migration
  def change
    create_table :user_merchant_friendships do |t|
      t.integer :user_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end
