class UsersController < ApplicationController
  
 
    get '/signup' do
      redirect '/home' if logged_in?
      erb :'users/signup'
    end

    post '/signup' do
      @user = User.new(:username => params[:username], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect "/home"
      else
        erb :'users/signup'
      end
    end

    get '/login' do
      redirect '/home' if logged_in?
      @failed = false
      erb :'users/login'
    end

    post '/login' do

      user = User.find_by(:username => params[:username])
      if !!user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/home"
      else
        @failed = true
        erb :'users/login'
      end
    end

    get '/home' do
        erb :'users/home'
    end

    delete '/logout' do
      session.clear
      redirect '/login'
    end


end