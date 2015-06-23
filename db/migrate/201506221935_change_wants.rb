class ChangeWants < ActiveRecord::Migration
  def change
    add_column :wants, :notified?, :boolean, :default => false
  end
end