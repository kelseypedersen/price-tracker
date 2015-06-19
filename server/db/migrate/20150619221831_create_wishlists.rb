class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|

      t.references :user
      t.references :product
      t.integer :max_price
      t.date :expiration
      t.boolean :fulfilled

      t.timestamps null: false
    end
  end
end
