class AddColumnsToWants < ActiveRecord::Migration
  def change
    add_column :wants, :notified, :boolean
    change_column_default :wants, :notified, false
    change_column_default :wants, :fulfilled, false
  end
end
