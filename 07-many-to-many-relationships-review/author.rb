class Author
  attr_reader :name
  attr_accessor :age

  @@all = []

  def self.all
    @@all
  end

  # The LABS!
  # Most of the beginning ones show you the wrong way to do things.
  # OHHHHHH! I GET IT!
  # Because we're creative, we try to hack things. <== stop this in its tracks

                # who would name it this? POLL!
                # author_name vs name
  # Arguments
  # => name: String, the authors name
  def initialize(name, age)
    @name = name
    @age = age

    @@all << self
  end

  # Sets up the has_many side of the relationship.
  # return all the books for this author
  def books
    # @books
    # Look over the Books class
    # try to find books that have
    # the same author as this one you're looking for
    Book.all.select do |book| # Book instance
      book.author == self
    end
  end
end # end of Author class
