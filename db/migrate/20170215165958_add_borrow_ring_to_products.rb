class AddBorrowRingToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :borrow_ring, :string
  end
end
