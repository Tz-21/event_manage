class ChangeColumnTypeFromProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :rent_status, :integer, default: 2
  end
end
