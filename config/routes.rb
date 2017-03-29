Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Products

  root to: "products#index"

  get "/scss_example" => "products#scss_example"
  
# Create and post new products
  get "/products/new" => "products#new"
  post "/products" => "products#create"

  # Search
  post "/search" => "products#search"
  get "/search" => "products#search"

  # Index and show
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  get "/products/random" => "products#random"
  delete "/products/:id" => "products#destroy"

  # Edit and Update
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"


  #------------------------------------------
  # Suppliers

  # Create and post new suppliers
  get "/suppliers/new" => "suppliers#new"
  post "/suppliers" => "suppliers#create"

  # Index and show
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  delete "/suppliers/:id" => "suppliers#destroy"

  # Edit and Update
  get "/suppliers/:id/edit" => "suppliers#edit"
  patch "/suppliers/:id" => "suppliers#update"

  post "/supplier_search" => "suppliers#search"

  #------------------------------------------
  # Images
  get "/products/:id/images/new" => "images#new"
  post "/products/:id/images" => "images#create"

  #------------------------------------------
  # Signup
  get "/signup" => "users#new"
  post "/users" => "users#create"

  #------------------------------------------
  # Login
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  #------------------------------------------
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  #------------------------------------------

  post "/cart" => "carted_products#create"
  delete "/cart/:id" => "carted_products#destroy"
  get "/checkout" => "carted_products#index"

end
