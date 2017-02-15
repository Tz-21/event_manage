class AddRentStatusToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :rent_status, :string
  end
end
