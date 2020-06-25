Rails.application.routes.draw do
  get 'users/index'
  get "/" => "home#top"
  get "/about" => "home#about"

  get "movie/new" => "movie#new"
  post "movie/create" => "movie#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "movie/:id" => "movie#show"
  get "movie/:id/index" => "movie#index"
  get "movie/:id/edit" => "movie#edit"
  post "movie/:id/update" => "movie#update"
  post "movie/:id/destroy" => "movie#destroy"

  get "users/index" => "users#index"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

end
