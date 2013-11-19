SdBrewHop::Application.routes.draw do


  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  delete 'sessions/destroy', as: :sign_out

  resources :breweries do
    resources :hops
  end

  resources :users, only: [:show]
  get "profile" => 'users#show', as: :profile

  get "legal/terms"   => 'home#terms',   as: :terms
  get "legal/privacy" => 'home#privacy', as: :privacy

  root "home#home"

end
