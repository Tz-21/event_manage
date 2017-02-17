class ChangeIdPhotoTypeFromClients < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :id_photo, :string
  end
end
