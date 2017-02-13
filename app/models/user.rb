class User < ApplicationRecord
  has_many :clients
  has_many :products
  
end
