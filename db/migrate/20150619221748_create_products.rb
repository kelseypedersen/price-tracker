class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.integer :shopstyle_id, :limit => 8

      t.timestamps null: false
    end
  end
end
