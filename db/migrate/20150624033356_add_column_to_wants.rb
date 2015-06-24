class AddColumnToWants < ActiveRecord::Migration
  def change
    add_column :product_name, :string
  end
end
