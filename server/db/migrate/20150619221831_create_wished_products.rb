class CreateWishedProducts < ActiveRecord::Migration
  def change
    create_table :wished_products do |t|

      t.timestamps null: false
    end
  end
end
