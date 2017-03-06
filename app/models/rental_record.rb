class RentalRecord < ApplicationRecord
  belongs_to :product
  belongs_to :client

  def self.create_with_client(params, ring_id)
    client = Client.find_by(ring_id: ring_id)
    return nil if client.nil?
    params.merge!(client_id: client.id)
    create(params)
  end
end
