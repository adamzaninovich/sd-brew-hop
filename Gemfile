source 'https://rubygems.org'

gem 'rails', '4.0.1'
gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails', '0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'

gem "bootstrap-sass", "~> 3.0.2.1"
gem "devise", "~> 3.2.0" # run `rails g devise:views` to customize views
gem "omniauth"
gem "omniauth-facebook", '~> 1.4.1'

gem 'rmagick', '~> 2.13.2'
gem 'carrierwave', '~> 0.9.0'
gem 'fog', '~> 1.18.0'
gem 'unf', '~> 0.1.3'

gem 'annotate', '2.5.0'

group :production do
  gem 'pg'
  gem 'thin'
end

group :development do
  gem 'pry'
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
