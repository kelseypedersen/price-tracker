class AddColumnToWants < ActiveRecord::Migration
  def change
    add_column :wants, :product_name, :string
  end
end
