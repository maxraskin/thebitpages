class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submissions do |t|
      t.string :username
      t.string :merchant_name
      t.string :merchant_website
      t.text :comment

      t.timestamps
    end
  end
end
