class CartController < ApplicationController
  def update
    # byebug
    # session[:cart_id] = params[:nacho_id]
    add_nacho_to_cart(params[:nacho_id])
    flash[:notice] = "Successfully added a #{params[:nacho_name]} to cart!"
    redirect_to nachos_path

  end


end
