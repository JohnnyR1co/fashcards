Rails.application.config.sorcery.submodules = [:external, :remember_me]

Rails.application.config.sorcery.configure do |config|

  config.external_providers = [:github]
  config.github.key = "5dc5ba33b9dc14101227"
  config.github.secret = "99115f4606913c1f58e808621e6a5ade29cbd3c4"
  config.github.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=github"
  config.github.user_info_mapping = { email: "name" }

  config.user_config do |user|
    user.authentications_class = Authentication
  end

  config.user_class = "User"
end
