Rails.application.config.sorcery.submodules = [:external, :remember_me]

Rails.application.config.sorcery.configure do |config|

  config.external_providers = [:github]
  config.github.key = Rails.application.secrets.github_key
  config.github.secret = Rails.application.secrets.github_secret
  #config.github.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=github"
  config.github.callback_url = "https://afternoon-inlet-3573.herokuapp.com/oauth/callback?provider=github"
  
  config.github.user_info_mapping = { email: "name" }

  config.user_config do |user|
    user.authentications_class = Authentication
  end

  config.user_class = "User"
end
