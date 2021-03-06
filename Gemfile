# good practice to always put your ruby version at the top of the document
ruby '2.3.1'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Devise gem for user authentication
gem 'devise', '~> 4.2'

# Add front end framework
gem 'foundation-rails'

# Foundation Icons font-size
gem 'foundation-icons-sass-rails'

# Add gem for voting system
gem 'acts_as_votable', '~> 0.10.0'

# Simple form for the comments
gem 'simple_form'

# This gem provides methods for generating container tags, such as div, for your record.
gem 'record_tag_helper', '~> 1.0'

# For a cleaner rails console
gem "awesome_print", require:"ap"

# To seed fake databse
gem 'faker'

# Dealing with sensitive data
gem 'figaro', '1.0'

# Pundit to authorize different users to different tasks
gem 'pundit'

# Pagination for posts
gem 'will_paginate', '~> 3.0.5'
gem 'will_paginate-foundation'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Supporting gem for rails panel
  gem 'meta_request'
  # Better error package
  gem "better_errors"
  # Helps deal with N+1 queries
  gem 'bullet'
end

group :production do
  # Ensure we use postgress databse when we push to heroku
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
