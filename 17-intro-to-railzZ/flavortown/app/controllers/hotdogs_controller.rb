class HotdogsController < ApplicationController

  #index
  # get '/hotdogs'
  def index
    # model
    @hotdogs = Hotdog.all
    # response
    render :index
  end

  # get '/hotdogs/:id'
  def show
    @hotdog = Hotdog.find(params[:id])
    render :show
  end

  def new
    #model
    # just new form no need for model
    # render :new
  end

  def makemeahotdog
  end

  def create
    # logic
    @hotdog = Hotdog.create(params)
    redirect_to "/hotdogs"
  end

  def edit
  end

  def update

  end

  def delete

  end


end
