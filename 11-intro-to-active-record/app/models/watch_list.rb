# camelCase
# PascalCase
# snake_case
# kebab-case

class WatchList < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  # def user
  #   User.find(self.user_id)
  # end
end
