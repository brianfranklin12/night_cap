Rails.application.routes.draw do
  get "/signup" => "registrations#new"
  post "/signup" => "registrations#create"
  delete "/signup" => "registrations#destroy", as: :destroy_registration

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  delete "/signout" => "sessions#destroy"

  get "/auth/twitter/callback" => 'sessions#create_with_twitter'

  get "/account" => "passwords#edit", as: :edit_password
  patch "/account" => "passwords#update"
  
  resources :users do 
    resources :cocktails, only: [:show, :index]
  end
  
  resources :ingredients, only: [:show] do 
    resources :cocktails, only: [:show, :index]
  end

  resources :cocktails do
    resources :likes
    resources :comments
  end

  resources :ingredients

  resources :comments

  root to: "sessions#new"

end
