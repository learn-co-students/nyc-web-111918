class PlayersController < ApplicationController
  before_action :find_player, only: [:show, :edit, :update, :destroy]

  def index
    # we want to show all the players
    @players = Player.all
    # renders index.erb
  end

  def show
    # @player = Player.find(params[:id])
  end

  def new
    # to create, renders the form
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    # redirect_to player_path(@player)
    redirect_to @player
  end

  # render the form to edit the player
  def edit
    # @player = Player.find(params[:id])
  end

  def update
    # @player = Player.find(params[:id])
    # in between, we want to do something useful
    @player.update(player_params)
    redirect_to @player
  end

  def destroy
    # @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end

  # needs to require them, limit them for security
  # STRONG params!
  def player_params
    params.require(:player).permit(:name, :hair_color, :blood_type)
  end
end
