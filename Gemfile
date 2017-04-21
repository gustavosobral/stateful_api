source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'devise'
gem 'devise_token_auth'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails', '~> 5.0.2'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'airborne'
  gem 'database_cleaner'
  gem 'simplecov'
end
