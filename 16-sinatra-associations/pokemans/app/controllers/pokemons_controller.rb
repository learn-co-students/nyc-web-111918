class PokemonsController < ApplicationController

  # => new
  # form
  get '/pokemons/new' do
    # model?
    @trainers = Trainer.all
    #resp
    erb :"pokemons/new"
  end

  # create
  post '/pokemons' do
    binding.pry
    # model??
    pokemon = Pokemon.create(params[:pokemon])
    redirect "/trainers/#{pokemon.trainer_id}"
    #bad
    # erb :"trainers/show"
  end


end
