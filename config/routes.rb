Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    root "pages#welcome"
    get "start_check" => "pages#start_check"
    resources :user_sessions
    resources :users
    resources :cards
    resources :decks
    get "random" => "cards#random"
    put "check" => "cards#check"
    patch "check" => "cards#check"
    get "login" => "user_sessions#new", as: :login
    post "logout" => "user_sessions#destroy", as: :logout
    post "oauth/callback" => "oauths#callback"
    get "oauth/callback" => "oauths#callback"
    get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  end
end
