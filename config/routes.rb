Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/scss_example" => "products#scss_example"
  
# Create and post new products
  get "/products/new" => "products#new"
  post "/products" => "products#create"

  # Index and show
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  delete "/products/:id" => "products#destroy"

  

  # Edit and Update
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"

end
