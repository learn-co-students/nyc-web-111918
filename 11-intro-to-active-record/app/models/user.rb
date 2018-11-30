class User < ActiveRecord::Base
  # nothing! barren wasteland!!!
  has_many :watch_lists
  has_many :movies, through: :watch_lists
  # belongs_to

  # def watch_lists
  #   WatchList.all.select do |wl|
  #     wl.user_id == self.id
  #   end
  # end

  # def movies
  #   self.watch_lists.map do |wl|
  #     Movie.find(wl.movie_id)
  #   end
  # end
end
