Rails.application.routes.draw do
  get '/app/index'
  get 'app/register'
  get 'app/login'
  get 'app/add'
  get 'app/telefon/:id', to: 'app#telefon'
  post 'app/registeraction'
  post 'app/loginaction'
  post 'app/addaction'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "app#index"
end
