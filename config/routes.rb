Rails.application.routes.draw do
  get "/" => "home#top"
  get "/about" => "home#about"
  get "movie/index" => "movie#index"
  get "movie/new" => "movie#new"
  post "movie/create" => "movie#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "movie/:id" => "movie#show"
  get "movie/:id/edit" => "movie#edit"
  post "movie/:id/update" => "movie#update"
  post "movie/:id/destroy" => "movie#destroy"
end
