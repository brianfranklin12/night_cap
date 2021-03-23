Rails.application.routes.draw do
  get "/signup" => "registrations#new"
  post "/signup" => "registrations#create"
  delete "/signup" => "registrations#destroy", as: :destroy_registration

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"

  get "/auth/twitter/callback" => 'sessions#create_with_twitter'

  get "/password" => "passwords#edit", as: :edit_password
  patch "/password" => "passwords#update"

  delete "/signout" => "sessions#destroy"
  
  resources :users do 
    resources :cocktails, only: [:show, :index]
  end
  
  resources :ingredients, only: [:show] do 
    resources :cocktails, only: [:show, :index]
  end

  resources :cocktails do
    resources :likes
  end
  
  resources :ingredients

  root to: "cocktails#index"
end
