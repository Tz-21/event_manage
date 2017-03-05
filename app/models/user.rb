class User < ApplicationRecord

  enum role: {firm: 1, admin: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  paginates_per 10

  has_many :clients
  has_many :products

end
