Rails.application.routes.draw do
  get '/app/index'
  get 'app/register'
  get 'app/login'
  get 'app/add'
  get 'app/telefon/:id', to: 'app#telefon'
  get 'app/usun/:id', to: 'app#usun'
  get 'app/modyfikuj/:id', to: 'app#modyfikuj'
  get 'app/twojeogloszenia'
  get 'app/logout'
  post 'app/registeraction'
  post 'app/loginaction'
  post 'app/addaction'
  post 'app/modyfikujaction'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "app#index"
   match "*path" => redirect("/"), via: [:get,:post]
end
