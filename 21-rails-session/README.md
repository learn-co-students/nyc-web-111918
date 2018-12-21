# Sessions and Cookies in R A I L S

![](https://media.giphy.com/media/Z0lWsgfBeuv60/giphy.gif)
![](https://media.giphy.com/media/xT0xeMA62E1XIlup68/giphy.gif)


# What are Sessions?

### From the [Rails Docs](https://guides.rubyonrails.org/security.html#sessions):

- HTTP is a stateless protocol. Sessions make it stateful.

```
Most applications need to keep track of certain state of a particular user. This
could be the contents of a shopping basket or the user id of the currently
logged in user. Without the idea of sessions, the user would have to identify,
and probably authenticate, on every request. Rails will create a new session
automatically if a new user accesses the application. It will load an existing
session if the user has already used the application.

A session usually consists of a hash of values and a session ID, usually a
32-character string, to identify the hash. Every cookie sent to the client's
browser includes the session ID. And the other way round: the browser will send
it to the server on every request from the client. In Rails you can save and
retrieve values using the session method:
```

```ruby
# in application controller
session[:user_id] = @current_user.id
User.find(session[:user_id])
```

---

### Application Controller

Since our cart is relevant to our application as a whole, we interact with it in the application controller instead of one of our child controllers

```ruby
class ApplicationController < ActionController::Base
  # helper_method :add_nacho_to_cart => will make this method accessible in views; i can still call it in my controllers since they all inherit from ApplicationController

  def cart # returns the cart array stored in session
    # returns my current cart by reading from session hash
    session[:cart] ||= []
    # if session[:cart]
    #   session[:cart]
    # else
    #   session[:cart] = []
    # end
  end

  def add_nacho_to_cart(nacho_id) # adds a nacho_id to the cart stored in session
    # call cart method defined above to write to the cart
    cart << nacho_id
  end

  def get_items_from_cart # take the nacho_ids in the cart and return ruby instances by talking to the model (Nacho.find)
    @cart_items = Nacho.find(cart)
  end
end
```

---

## Cart Controller

```ruby
class CartController < ApplicationController
  def update
    # i want a helper method somewhere that reads and writes to the session hash
    # call method on ApplicationController that adds a nacho_id to my cart that is stored in the rails session hash
    add_nacho_to_cart(params[:nacho_id])
    flash[:notice] = "Successfully added #{params[:name]} to cart"
    redirect_to nachos_path
  end
end
```

---

## Nachos Controller

```ruby
class NachosController < ApplicationController
  before_action :find_nacho, only: :show
  before_action :get_items_from_cart, only: :index

  def index
    @nachos = Nacho.all
  end

  def show
    render :show
  end

  private

  def find_nacho
    @nacho = Nacho.find(params[:id])
  end
end
```

---

## Routes

```ruby
Rails.application.routes.draw do
  resources :nachos, only: [:index, :show]
  patch '/cart', to: 'cart#update', as: 'add_to_cart'
end
```

---

![](https://media.giphy.com/media/Vxk8eYR1fV0Qw/giphy.gif)

---

## External Resources:

- [Rails Docs on Sessions](https://guides.rubyonrails.org/security.html#sessions)
- [Wiki Page on HTTP Headers](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)
- [Guy Fieri Restaurant](http://www.guyfieri.com/eat-at-guys)

![](https://media.giphy.com/media/nAErqE3k2C3fy/giphy.gif)
