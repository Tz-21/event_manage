class Product < ApplicationRecord
  enum rent_status: { rent:1, free:2 }

  belongs_to :user
  belongs_to :client, optional: true
end
