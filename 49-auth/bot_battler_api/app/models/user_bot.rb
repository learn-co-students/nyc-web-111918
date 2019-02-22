class UserBot < ApplicationRecord
  belongs_to :user
  belongs_to :bot
end
