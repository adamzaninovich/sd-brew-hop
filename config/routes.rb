SdBrewHop::Application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :breweries

  get "legal/terms"   => 'home#terms',   as: :terms
  get "legal/privacy" => 'home#privacy', as: :privacy

  root "home#index"

end
