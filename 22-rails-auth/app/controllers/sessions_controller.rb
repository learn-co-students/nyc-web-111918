class SessionsController < ApplicationController
  # before_action :authorized comes from ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    render :new #looks in app/views/sessions/new.html.erb
  end

  def create #handles the POST request to /login
    # find out if we have a user with this username
    @user = User.find_by(username: params[:username])
    # get that user record from DB
    # authenticate this user; determine if they provided the correct pw
    if @user && @user.authenticate(params[:password])
      # once we have found the user, create a new session for them
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to @user
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = nil
    flash[:notice] = 'u logged out'
    redirect_to login_path
  end
end
