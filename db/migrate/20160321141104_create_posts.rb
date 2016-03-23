class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_message
      t.references :tour, index: true

      t.timestamps
    end
  end
end
