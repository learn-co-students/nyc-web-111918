class DecksController < ApplicationController
  before_action :find_deck, only: [:show, :edit, :update, :destroy]

  def index
    # we want to show all the decks
    @decks = Deck.all
    # renders index.erb
  end

  def show
    # @deck = Deck.find(params[:id])
  end

  def new
    # to create, renders the form
    @deck = Deck.new
    @players = Player.all
  end

  def create
    byebug
    @deck = Deck.create(deck_params)
    # redirect_to deck_path(@deck)
    redirect_to @deck
  end

  # render the form to edit the deck
  def edit
    # @deck = Deck.find(params[:id])
  end

  def update
    # @deck = Deck.find(params[:id])
    # in between, we want to do something useful
    @deck.update(deck_params)
    redirect_to @deck
  end

  def destroy
    # @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end

  private

  def find_deck
    @deck = Deck.find(params[:id])
  end

  # needs to require them, limit them for security
  # STRONG params!
  def deck_params
    params.require(:deck).permit(:cards, :deck_type, :player_id) # that id comes from value_method
  end
end
