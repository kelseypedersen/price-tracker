class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|

      t.references :user
      t.references :product
      t.integer :max_price
      t.date :expiration
      t.boolean :fulfilled
      t.string :prod_name
      t.string :url

      t.timestamps null: false
    end
  end
end
