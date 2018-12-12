class TrainersController < ApplicationController


  # index
    get '/trainers' do
      # model
      @trainers = Trainer.all
      # response
      erb :"trainers/index"
    end

    # new
    # just the form not submitting
    get '/trainers/new' do
      #model??
      #resp?
      erb :'trainers/new'
    end

  # show
    get '/trainers/:id' do
      @trainer = Trainer.find(params[:id])
      erb :"trainers/show"
    end


  # create
  post '/trainers' do
    @trainer = Trainer.create(params)
    redirect "/trainers/#{@trainer.id}"
  end

  # edit
  # form
  get '/trainers/:id/edit' do
    # model?
    @trainer = Trainer.find(params[:id])
    #resp?
    erb :"trainers/edit"
  end

  # update
  # do i need to know which trainer??
  # pppst yes
  patch '/trainers/:id' do
    #model
    @trainer = Trainer.find(params[:id])
    @trainer.update(params[:trainer])
    #view // resp
    redirect "/trainers/#{@trainer.id}"
  end


  # delete

end
