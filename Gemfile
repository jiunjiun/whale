source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# debug
gem "pry"
gem "pry-rails"
gem "awesome_print", require: false

group :development, :test do # 也包含 test 是為了讓寫 test case 時也可以 debug
  # gem "pry-plus"
  gem "hirb", require: false
  gem "hirb-unicode", require: false

  # RSpec
  gem "rspec-rails"
  gem "factory_girl_rails"

  # deployment
  gem "capistrano", "~> 3.8"
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'

  gem "rails-erd"
end

# User account
gem 'devise'
gem 'devise-i18n'

# i18n
gem "rails-i18n"

# Use for google analytics
gem 'google-analytics-rails'

# mixpanel
gem 'mixpanel-ruby'

# form
gem 'simple_form'

# upload
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem "fog-google"
gem "google-api-client", ">= 0.6.2", "< 0.9"
gem "mime-types"

# Settings
gem "settingslogic"

# SEO meta
gem 'meta-tags'

# sitemap
gem 'sitemap_generator'

# crontab
gem 'whenever', :require => false

# pagination
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

#
gem 'active_hash'
gem 'decent_exposure', '3.0.2'

# search
gem 'ransack', github: 'activerecord-hackery/ransack'

# Style
gem 'slim'
gem 'slim-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'noty-rails'
