class Team
  attr_reader :name, :colors

  # CREATIVITY!!!
  # this is going to be your database
  @@all = []

  def initialize(name, colors)
    @name = name
    @colors = colors

    @@all << self
  end

  def self.all
    @@all
  end

  # return all the players on this team
  def players
    # Array of Player instances
    Player.all.select do |player| # Player instance
      player.team    == self
      # Team instance  # Team instance calling .players
    end
  end
end # end of Team class
