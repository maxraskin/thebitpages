class CreateMerchantProfiles < ActiveRecord::Migration
  def change

    create_table :merchant_profiles do |t|
      t.integer :merchant_id

      t.timestamps
    end
  end
end
