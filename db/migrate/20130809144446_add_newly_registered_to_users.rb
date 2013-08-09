class AddNewlyRegisteredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newly_registered, :boolean, :default => true
  end
end
