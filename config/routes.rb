Rails.application.routes.draw do
  resources :studios, only: [:index, :show]
  resources :movies, only: [:show]
  resources :actors, only: [:new, :create]
end
