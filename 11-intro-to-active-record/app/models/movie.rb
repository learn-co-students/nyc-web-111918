class Movie < ActiveRecord::Base
  has_many :watch_lists
  has_many :users, through: :watch_lists

  # the old way
  # def watch_lists
  #   WatchList.all.select do |wl|
  #     wl.movie_id == self.id
  #   end
  # end

  # def users
  #   self.watch_lists.map do |wl|
  #     User.find(wl.user_id)
  #   end
  # end
end
