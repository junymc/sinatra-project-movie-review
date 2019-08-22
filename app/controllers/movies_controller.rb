class MoviesController < ApplicationController

    get '/movies' do
        if logged_in?
           @movies = Movie.all
           erb :'movies/index'
        else
            redirect '/login'
        end
    end

    get '/movies/:id' do
        authorize
        @movie = Movie.find_by(id: params[:id])
        if @movie
            erb :'movies/show'
        else
            erb :'error'
        end    
    end

    post '/search' do
        authorize
       
        @movie = Movie.find(name: clean(params[:movie_name].capitalize))
        if !@movie.errors.any?
            redirect '/search'
        else
            erb :'users/home'
        end
    end

    get '/search' do
        authorize
        
        @movie = Movie.find_by(name: params[:movie_name])
        if @movie
            erb :'movies/show'
           
        else
            @message = "Sorry, that movie can not be found."
            redirect '/home'
        end
    end

end