module ActiveRecord
  class Base
    ALL = [] # this will always be an array

    # to also pull from the database
    def self.all
      # only has the instances we've made
      # Problem: it doesn;t have any instances that were previously
      # saved in the database

      # grab all those database rows
      # make new instances with them so i have it in ruby
      # also merge that into ALL
      # => so we can have a self.all that has everything everywhere

      # {
      #   "id"=>8,
      #   "username"=>"mike",
      #   "message"=>"hello world",
      #   0=>8,
      #   1=>"mike",
      #   2=>"hello world"
      # }
                                                      # making this generic
      all_dem_rows = DB[:conn].execute("SELECT * FROM #{self.to_s.downcase.pluralize};")
      # binding.pry
      all_dem_rows.each do |row|
        # binding.pry
        found_instance = ALL.find do |instance|
          instance.id == row['id']
        end
        # binding.pry
        if !found_instance
          self.new(row)
        end
      end
      ALL
      # so why store it twice?
      # very good question!
    end

    def save
      # SQL INJECTION
      # prevent malicious users
      # a'); DROP TABLE tweets; --
      sql = <<-SQL
        INSERT INTO tweets (message, username)
        VALUES (?, ?);
      SQL

      # binding.pry
      # persist
      if !!@id
        # update
      else
        DB[:conn].execute(sql, self.message, self.username)
        # but i don't know what i am, save the id
        @id = DB[:conn].execute("SELECT * FROM tweets;").last["id"]
      end
      self
      # There is! BUT I'm not going to fix it. WHY? BECAUSE SOEMONE ELSE GHAS ALREADY DONE IT!
    end
  end
end

class Tweet < ActiveRecord::Base
  attr_reader :id
  attr_accessor :message, :username

  ALL = [] # this will always be an array

  # to also pull from the database
  def self.all
    # only has the instances we've made
    # Problem: it doesn;t have any instances that were previously
    # saved in the database

    # grab all those database rows
    # make new instances with them so i have it in ruby
    # also merge that into ALL
    # => so we can have a self.all that has everything everywhere

    # {
    #   "id"=>8,
    #   "username"=>"mike",
    #   "message"=>"hello world",
    #   0=>8,
    #   1=>"mike",
    #   2=>"hello world"
    # }

    all_dem_rows = DB[:conn].execute("SELECT * FROM tweets;")
    # binding.pry
    all_dem_rows.each do |row|
      # binding.pry
      found_instance = ALL.find do |instance|
        instance.id == row['id']
      end
      # binding.pry
      if !found_instance
        Tweet.new(row)
      end
    end
    ALL
    # so why store it twice?
    # very good question!
  end

  def initialize(props={})
    @message = props['message']
    @username = props['username']
    @id = props['id'] # nil
    ALL << self
  end

  # OMG !!
  # NEVER WRITE YOUR OWN!!!
  def save
    # SQL INJECTION
    # prevent malicious users
    # a'); DROP TABLE tweets; --
    sql = <<-SQL
      INSERT INTO tweets (message, username)
      VALUES (?, ?);
    SQL

    # binding.pry
    # persist
    if !!@id
      # update
    else
      DB[:conn].execute(sql, self.message, self.username)
      # but i don't know what i am, save the id
      @id = DB[:conn].execute("SELECT * FROM tweets;").last["id"]
    end
    self
    # There is! BUT I'm not going to fix it. WHY? BECAUSE SOEMONE ELSE GHAS ALREADY DONE IT!
  end
end
