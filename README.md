# sinatra-project-movie-review

## Objectives

 Build a Sinatra application that uses:

 - MVC
 - RESTful routes
 - ActiveRecord(Models, Associations)
 - A sqlite database
 - Login/Logout
 
 ## Overview

 This project is building a simple Content Management System (CMS) using the tools we've learned so far.

 It can track the reviews of movies from users and user needs to sign up to see or wirte reviews. Once the user is logged in, they are able to create, edit and delete their own reviews but they will still able to see other user's posts.

 ## Instructions

 You will need to have these gems in your `Gemfile`.

 ```
source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

```

After add these in the `Genfile`, do `bundle install` to install all the required gems.

## Contributing

This project is open source under the MIT license, which means you have full access to the source code and can modify it to fit your own needs.
 