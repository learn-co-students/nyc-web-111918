class TeamColor
  attr_reader :team, :color

  @@all = []
                 # Team instance, Color instance
  def initialize(team, color)
    @team = team
    @color = color

    @@all << self
  end

  def self.all
    @@all
  end
end # end of TeamColor class
