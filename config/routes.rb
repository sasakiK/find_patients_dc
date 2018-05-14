Rails.application.routes.draw do

  root "tops#index"

  resources :results, only: [:index]

  get "results/:id/download" => "downloads#download" #要変更

  get "/" => "home#top"
  get "about" => "home#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
