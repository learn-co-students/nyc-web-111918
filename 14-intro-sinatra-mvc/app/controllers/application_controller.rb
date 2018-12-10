class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  # set :method_override, true

  # TODO create a route to root/home render home
  get '/' do
    puts "do i really get here?"
    # "<h1>Hello World</h1>"
    erb :index
  end


  # TODO all books
  # Index page for Books
  # - GET /books
  get '/books' do
    # binding.pry
    # book_titles = Book.all.map do |book|
    #   "#{book.title}"
    # end
    # omg, how do i turn this into HTML!!!!???
    @books = Book.all
    erb :books
  end


  # TODO Individual book
  # GET /books/:id
  get '/books/:id' do
    # binding.pry
    @book = Book.find(params[:id])
    erb :show
  end

end
