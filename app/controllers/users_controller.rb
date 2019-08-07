class UsersController < ApplicationController
  
 
    get '/signup' do
      erb :'users/signup'
    end

    post '/signup' do
      user = User.new(:username => params[:username], :password => params[:password])
      session[:user_id] = user.id
      if user.save
        redirect "/home"
      else
        "Oop! Something went wrong. Try again!"
        erb :'users/signup'
      end
    end

    get '/login' do
      erb :'users/login'
    end

    post '/login' do

      user = User.find_by(:username => params[:username])
      # binding.pry
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/home"
      else
        "Oop! Something went wrong. Try again!"
        erb :'users/login'
      end
    end

    get '/home' do
        erb :'users/home'
    end

  




end