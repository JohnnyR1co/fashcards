Rails.application.routes.draw do
  root "pages#welcome"
  resources :user_sessions
  resources :users
  resources :cards
  get "random" => "cards#random"
  put "check" => "cards#check"
  patch "check" => "cards#check"
  get "login" => "user_sessions#new", :as => :login
  post "logout" => "user_sessions#destroy", :as => :logout
end
