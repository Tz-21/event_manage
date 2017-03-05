class Product < ApplicationRecord
  enum rent_status: { rent:1, free:2 }
  paginates_per 10

  belongs_to :user
  has_many :rental_records
end
