require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', # we're using a sqlite database
  database: "db/development.sqlite" # here's the database
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
