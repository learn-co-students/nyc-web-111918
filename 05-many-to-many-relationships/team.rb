class Team
  attr_reader :name #, :colors

  # CREATIVITY!!!
  # this is going to be your database
  @@all = []

  def initialize(name) #, colors)
    @name = name
    # @colors = colors

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

  # finish the relationship of Team to Color
  def colors
    # we have a list of all team colors
    # this stores the relationship
    # we can figure out what colors this team
    # is related to, THROUGH TeamColors

    # find all the relationships
    # by searching through TeamColor
    # my_team_colors = TeamColor.all.select do |team_color| # TeamColor instance
    #   # find which ones are ours
    #   # Team instance    # Team instance
    #   team_color.team == self
    # end
    # then from those relationships,
    self.team_colors.map do |team_color| # TeamColor instance
      # determine what colors we have
      team_color.color
    end
    # Array of Color instances
  end

  # helper method
  def team_colors
    TeamColor.all.select do |team_color|
      team_color.team == self
    end
  end
end # end of Team class
