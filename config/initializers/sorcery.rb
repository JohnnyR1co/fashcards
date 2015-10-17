Rails.application.config.sorcery.submodules = [:remember_me, :external]

Rails.application.config.sorcery.configure do |config|

  config.external_providers = [:github]
  config.github.key = "57c78c362773a51eb5ed"
  config.github.secret = "6b33930089255f28b21c6c4ee8de585d6799759e"
  config.github.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=github"
  config.github.user_info_mapping = {:email => "name"}

  config.user_config do |user|

    user.authentications_class = Authentication

  end

  config.user_class = "User"
end
