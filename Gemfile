source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.3'
gem 'haml', '~> 5.0', '>= 5.0.2'

gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.3'
gem 'cocoon'
gem 'cancancan', '~> 2.0'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'devise-i18n'
gem 'chartjs-ror'
gem 'ransack'
gem 'rubocop', '~> 0.50.0', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'factory_bot_rails'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'site_prism'
  gem 'shoulda-matchers', '~> 3.1', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
