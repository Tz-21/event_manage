class Client < ApplicationRecord
  enum borrow_status: {product_empty: 1, product_full: 2}
  paginates_per 10

  mount_uploader :id_photo, PhotoUploader

  belongs_to :user
  has_many :rental_records

  validates :ring_id, uniqueness: { message: "手環ID已經被使用，請更換" }
end
