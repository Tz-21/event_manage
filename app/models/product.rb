class Product < ApplicationRecord
  enum rent_status: { rent:1, free:2 }
  paginates_per 10

  belongs_to :user
  has_many :rental_records

  validates :item_code, uniqueness: { scope: :user_id, message: "商品代碼已經被使用，請更換" }
end
