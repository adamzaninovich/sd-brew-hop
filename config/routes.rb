SdBrewHop::Application.routes.draw do

  resources :breweries

  get "legal/terms"   => 'home#terms',   as: :terms
  get "legal/privacy" => 'home#privacy', as: :privacy

  root "home#index"

end
