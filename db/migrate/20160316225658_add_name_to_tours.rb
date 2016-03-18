class AddNameToTours < ActiveRecord::Migration
  def change
    add_column :tours, :firstname, :string
    add_column :tours, :lastname, :string
    add_column :tours, :user_id, :integer
  end
end
