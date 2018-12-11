class HolidayController < ApplicationController


  # 7 RESTFUL ROUTES
  # index Displays ALL of a resource
  get '/holidays' do
    # Model
    @holidays = Holiday.all

    # Response -- ERB -- View
    erb :"holidays/index"
  end

  # CREATE
  # GET // POST
  # new
  # GET render a form for user input
  get '/holidays/new' do
    #model
    # nothing from model for the form
    #view
    erb :"holidays/new"
  end

  # show all the deets of a resource
  get '/holidays/:id' do
    # binding.pry
    # model
    @holiday = Holiday.find(params[:id])
    # response// view
    erb :"holidays/show"
  end


  # CREATE
  # create
  post '/holidays' do
    holiday = Holiday.create(params)
    redirect :"/holidays/#{holiday.id}"
  end

  # CRUD

  # Create
  # POST -


  # Read
  # GET - READ


  # Update
  # PUT/PATCH


  # Delete
  # Delete

  # HTTP VERBS
  # GET
  # POST
  # PUT/PATCH
  # Delete

end
