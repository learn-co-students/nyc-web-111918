class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true

  has_many :user_bots
  has_many :bots, through: :user_bots
end
