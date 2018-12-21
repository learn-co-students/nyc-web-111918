class ApplicationController < ActionController::Base

  def cart
    session[:cart] ||= []
  #   if session[:cart]
  #     session[:cart]
  #   else
  #     session[:cart] = []
  #   end
  end

  def add_nacho_to_cart(nacho_id)
    cart << nacho_id
  end

  def get_items_from_cart
    @cart_items = Nacho.find(cart)
  end

end
