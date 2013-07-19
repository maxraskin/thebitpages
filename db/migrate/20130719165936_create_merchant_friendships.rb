class CreateMerchantFriendships < ActiveRecord::Migration
  def change
    create_table :merchant_friendships do |t|
      t.integer :merchant_id
      t.integer :merchant_friend_id

      t.timestamps
    end
  end
end
