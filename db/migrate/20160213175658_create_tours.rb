class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :tourtype
      t.date :day
      t.time :time

      t.timestamps
    end
  end
end
