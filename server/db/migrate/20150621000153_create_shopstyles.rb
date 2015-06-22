class CreateShopstyles < ActiveRecord::Migration
  def change
    create_table :shopstyles do |t|

      t.timestamps null: false
    end
  end
end
