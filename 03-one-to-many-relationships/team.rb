class Team
  attr_reader :name, :colors
  # attr_accessor :players

  # CREATIVITY!!!
  # this is going to be your database
  @@all = []

  def initialize(name, colors) #, players)
    @name = name
    @colors = colors
    # @players = players

    @@all << self
  end

  def self.all
    @@all
  end

  # return all the players on this team
  def players
    # search through all the players
    # Array of Player instances
    Player.all.select do |player| # Player instance
      # ask each one => are you on my team?
      player.team       == self
      # Team instance      # Team instance calling .players
    end
  end
end # end of Team class
