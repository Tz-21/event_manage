class ChangeColumnTypeFromUsersAndClients < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :borrow_status, :integer, default: 1
    change_column :users, :role, :integer, default: 1
  end
end
