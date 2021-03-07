Rails.application.routes.draw do
  get "/signup" => "registrations#new"
  post "/signup" => "registrations#create"
  delete "/signup" => "registrations#destroy", as: :destroy_registration

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"

  get "/password" => "passwords#edit", as: :edit_password
  patch "/password" => "passwords#update"

  delete "/signout" => "sessions#destroy"
  

  resources :cocktails

  root to: "cocktails#index"
end
