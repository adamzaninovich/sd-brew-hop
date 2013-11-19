SdBrewHop::Application.routes.draw do

  # Auth
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  delete 'sessions/destroy', as: :sign_out

  # Resources
  resources :breweries do
    resources :hops
  end
  resources :activities

  # Static Pages
  get "legal/terms"   => 'home#terms',   as: :terms
  get "legal/privacy" => 'home#privacy', as: :privacy

  # Root
  root "home#home"

end
