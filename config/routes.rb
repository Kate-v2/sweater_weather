# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :forecasts,  only: [:index]
      resources :gifs,       only: [:index]
      resources :users,      only: [:create]
      resources :sessions,   only: [:create]
      resources :favorites,  only: [:create]
    end
  end







end
