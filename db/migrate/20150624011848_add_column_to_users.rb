class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :phone_number, :string
  end
end
