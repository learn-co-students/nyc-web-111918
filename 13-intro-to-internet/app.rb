# module Rack
#   class Request
#     def initialize(env_hash)
#       @env_hash = env_hash
#     end
#   end
# end

require 'pry'
require_relative 'song'

class App
  def call(env)

    request = Rack::Request.new(env)
    resp = Rack::Response.new

    # TODO: create some new songs
    Song.new("Cry me a river")
    Song.new("Bohemian Rhapasody")
    Song.new("Curse you wall what?")

    if request.path =~ /songs/
      song_list_items = Song.all.map { |song| "<li>#{song.title}</li>" }.join

      resp.write("
          <h1>Bomb Song List</h1>
          <ul>
            #{song_list_items}
          </ul>
        ")

    # elsif req.path =~ /artists/
    elsif request.path.match(/artists/)
      resp.write('<h1>Artists List</h1>')
    else
      resp.write('<div>
        <h1>Not Found</h1>
        <img src="https://i.kym-cdn.com/entries/icons/original/000/023/677/Screen_Shot_2017-08-15_at_11.57.51_AM.png" />
        </div>')
    end
    resp.finish
  end
end
