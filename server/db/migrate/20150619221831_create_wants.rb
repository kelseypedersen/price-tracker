class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|

      t.references :user
      t.references :product
      t.integer :max_price
      t.date :expiration
      t.boolean :fulfilled

      t.timestamps null: false
    end
  end
end
