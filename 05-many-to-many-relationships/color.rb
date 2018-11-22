class Color
  attr_reader :name # r, g, b, hue

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  # hey, what teams use this color?
  def teams
    # find all my TeamColor relationship information
    # my_team_colors = TeamColor.all.select do |team_color|
    #   team_color.color == self
    # end
    # from those relations, grab out the teams
    # Array of TeamColor instances
    self.team_colors.map do |team_color|
      team_color.team
    end
    # Array of Team instances
  end

  def team_colors
    TeamColor.all.select do |team_color|
      team_color.color == self
    end
  end
end # end of Color class
