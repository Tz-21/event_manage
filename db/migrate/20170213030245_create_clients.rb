class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :id_number
      t.string :mail
      t.string :company
      t.string :mobile_phone
      t.string :borrow_status
      t.string :ring_id
      t.text :id_photo
      t.timestamps
    end
  end
end
