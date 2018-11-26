class Book
  attr_reader :title, :published_date, :edition, :author

  # Set up the belongs_to side of the relationship.
  # def author
  #   @author
  # end

  @@all = []

  def self.all
    @@all
  end

                # Author instance , String ??
  def initialize(author, title, published_date, edition = 1)
    @title = title
    @published_date = published_date
    @edition = edition
    @author = author

    @@all << self
  end
end # end of Book class
