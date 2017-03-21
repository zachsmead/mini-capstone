Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  get "/scss_example" => "products#scss_example"
  
# Create and post new products
  get "/products/new" => "products#new"
  post "/products" => "products#create"

  # Index and show
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  get "/products/random" => "products#random"
  delete "/products/:id" => "products#destroy"

  # Edit and Update
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"

  post "/search" => "products#search"

  #------------------------------------------

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

end
