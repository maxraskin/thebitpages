class AllowNullEmail < ActiveRecord::Migration
  def up
    remove_index :merchants, :email
    change_column :merchants, :email, :string, :null => true
  end

  def down
    change_column :merchants, :email, :string, :null => false
    add_index :merchants, :email, unique: true
  end
end
