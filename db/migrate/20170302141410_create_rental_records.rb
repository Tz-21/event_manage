class CreateRentalRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :rental_records do |t|
      t.datetime :start_rent
      t.datetime :end_rent
      t.integer :client_id
      t.integer :product_id
      t.timestamps
    end
  end
end
