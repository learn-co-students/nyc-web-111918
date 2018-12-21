class NachosController < ApplicationController
  before_action :find_nacho, only: [:show]
  before_action :get_items_from_cart, only: [:index]

  def index # /nachos
    @nachos = Nacho.all
    # get_items_from_cart #invoke method in ApplicationController
    render(:index)
  end

  def show
    #before_action called first
    render(:show)
  end

  private

  def find_nacho
    @nacho = Nacho.find(params[:id])
  end
end
