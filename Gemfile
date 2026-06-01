source "https://rubygems.org"

gem "rails", "~> 8.1.2"

gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 4.4"
gem "jbuilder"
gem "devise"
gem "pg_search", "~> 2.3"
gem "faker", "~> 3.8"
gem 'kaminari', '~> 1.2', '>= 1.2.2'


gem "image_processing", "~> 1.2"
gem "tzinfo-data", platforms: %i[windows jruby]

gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

gem "bootsnap", require: false

gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "factory_bot_rails"
  gem 'rspec-rails', '~> 7.1'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end