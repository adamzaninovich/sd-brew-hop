SdBrewHop::Application.routes.draw do
  devise_for :users
  resources :breweries

  root 'breweries#index'
end
