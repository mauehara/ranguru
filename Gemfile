source 'https://rubygems.org'
ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.4'
#ruby=jruby-1.7.4
gem 'rails', '4.0.0'

group :development do
  gem 'activerecord-jdbc-adapter'
  gem 'jdbc-mysql'
  gem 'activerecord-jdbcmysql-adapter'
end

# Preparing for deploying in Heroku
group :production do 
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.0.1'
gem 'zurb-foundation'
gem 'will_paginate'

group :doc do
  gem 'sdoc', require: false
end

gem 'puma'
gem 'pry'
gem 'rack-offline'

gem 'activerecord-session_store', github: 'rails/activerecord-session_store'