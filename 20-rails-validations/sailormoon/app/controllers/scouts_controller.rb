class ScoutsController < ApplicationController


  # get '/scouts/:id'
  def show
    @scout = Scout.find(params[:id])
    render :show
  end

  def new
    @scout = Scout.new
    render :new
  end

  # def colored_hair
  #   @scout = Scout.find(params[:id])
  #   @scout.update_attribute(hair_color: params)
  #   redirect_to @scout
  # end

  def create
    @scout = Scout.create(new_scout_params)
    if @scout.valid?
      # flash[:notice] = "YOU JUST CREATED A NEW USER! wow wut lolz"
      redirect_to @scout
    else
      # byebug
      # flash[:errors] = @scout.errors.full_messages

      @errors = @scout.errors.full_messages
      render :new
      # redirect_to new_scout_path
    end
  end

    def update
      @scout.update(update_scout_params)
    end



  private

  # 💪 strong params
  def new_scout_params
    params.require(:scout).permit(:age,:hair_color,:planet,:pet)
  end
  # 💪 strong params
  def update_scout_params
    params.require(:scout).permit(:hair_color,:planet)
  end

end # end ScoutsController class
