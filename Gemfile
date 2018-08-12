source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Backend
gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'foreman'
gem 'redis', '~> 4.0'
# gem 'sidekiq'

# Tools
gem 'jbuilder', '~> 2.5'
gem 'figaro'
gem 'uglifier'
gem 'devise'
gem 'inherited_resources'
gem 'translate_enum'
# gem 'simple_form'
# gem 'carrierwave', '~> 1.2'
# gem 'nokogiri'
# gem 'deep_cloneable'
# gem 'rubyzip', '>= 1.0.0'
# gem 'zip-zip'
# gem 'whenever', require: false
# gem 'carrierwave-picture', :path => "/Users/arturgaraev/ruby/carrierwave-picture"
# gem "fog-aws", '~> 1.2'
# gem 'cancancan', '~> 2.0'
# gem 'bcrypt', '~> 3.1.7'

# Frontend
gem "komponent"
gem 'webpacker'

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'rails-erd', '~> 1.5'

end

group :development do

  gem 'better_errors'
  gem 'rack-cors', '1.0.2'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'seed_dump', '3.2.4'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.7',         require: false
  gem 'capistrano-rbenv', '2.1.3'
  gem 'capistrano-rails', '~> 1.2',   require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano3-puma', '~> 1.2',   require: false
  gem "capistrano-yarn"
  # gem 'capistrano-sidekiq', '1.0.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rb-readline'
