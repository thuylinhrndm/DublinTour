class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean => false
  end
end
