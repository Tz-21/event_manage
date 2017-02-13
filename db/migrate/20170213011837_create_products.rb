class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :item_code
      t.datetime :start_rent
      t.datetime :end_rent
      t.timestamps
    end
  end
end
