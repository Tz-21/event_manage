class AddUserIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :user_id, :integer
    add_column :products, :client_id, :integer
    add_column :products, :user_id, :integer
  end
end
