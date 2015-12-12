source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'damerau-levenshtein'
gem 'whenever', require: false
# Гем, который добавляет специфические для Rails таски, такие как прогон миграций и компиляция ассетов
gem 'capistrano-rails'
# Гем, добавляющий возможности bundle к capistrano
gem 'capistrano-bundler'
# Добавление поддержки Rbenv (менеджера версий для Ruby)
gem 'capistrano-rbenv'
# Интеграция пумы и капистрано
gem 'capistrano3-puma'
gem 'dotenv-rails', :groups => [:development, :test, :production]

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'pg'
gem 'sorcery'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'puma'
gem 'mailgun-rails'
gem 'http_accept_language'
gem 'rollbar', '~> 2.6.1'
gem 'responders', '~> 2.0'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
