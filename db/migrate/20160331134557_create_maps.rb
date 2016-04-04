class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :adress
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
