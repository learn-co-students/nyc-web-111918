class Bot < ApplicationRecord

  has_many :user_bots
  has_many :users, through: :user_bots
end
