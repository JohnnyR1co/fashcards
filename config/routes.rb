Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do
    scope module: "home" do
      resources :cards, :decks
      get "random" => "cards#random"
      put "check" => "cards#check"
      patch "check" => "cards#check"
    end
    scope module: "dashboard" do
      resources :users
      resources :user_sessions
      get "login" => "user_sessions#new", as: :login
      post "logout" => "user_sessions#destroy", as: :logout
      root "pages#welcome"
      post "oauth/callback" => "oauths#callback"
      get "oauth/callback" => "oauths#callback"
      get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
    end
  end
end
