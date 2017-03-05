class RemoveColumnFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :start_rent
    remove_column :products, :end_rent
    remove_column :products, :borrow_ring
    remove_column :products, :client_id
  end
end
