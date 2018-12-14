class AirplanesController < ApplicationController
  before_action :find_plane, only: [:show,:edit,:destroy]
    def index
      #model
      @aeroplanesz = Airplane.all
      #resp
    end

    def show
      # model?

      #resp?
    end

    def edit

    end

    # give me the form
    def new
      @airplane = Airplane.new
      #render :new
    end

    # ACTUALLY SAVE TO DB
    # post '/airplanes'
    def create
      #.create
      # byebug
      Airplane.create(airplane_params)
      # render?? redirect??
      redirect_to "/airplanes"
    end


    def destroy

      @airplane.destroy
      redirect_to airplanes_path
    end


    private
    #white list the attributes we WANT because of HaX0rZZ
    # strong params 💪
    def airplane_params
       params.require(:airplane).permit(:model,:wings)
    end

    def find_plane
      @airplane = Airplane.find(params[:id])
    end
end
