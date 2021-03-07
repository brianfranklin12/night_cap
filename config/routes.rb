Rails.application.routes.draw do
  get "/signup" => "registrations#new"
  post "/signup" => "registrations#create"

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"

  delete "/signout" => "sessions#destroy"
  
end
