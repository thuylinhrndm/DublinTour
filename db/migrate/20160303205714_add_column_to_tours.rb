class AddColumnToTours < ActiveRecord::Migration
  def change
    add_column :tours, :description, :string
    add_column :tours, :cost, :decimal
  end
end
