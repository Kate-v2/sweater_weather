# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get  'forecasts', to: 'forecasts#index'
      post 'user',      to: 'users#create'
      get  'user',      to: 'users#show'
    end
  end







end
