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
        authenticate
        @movie = Movie.find_by(id: params[:id])
        if @movie
            erb :'movies/show'
        else
            erb :'error'
        end    
    end

    post '/search' do
        authenticate
        @movie = Movie.find_by(name: clean(params[:movie_name].capitalize))
        if @movie
            redirect "/movies/#{@movie.id}"          
        else
           @msg = "Sorry, no results were found."   
           erb :error
        end
    end

    # get '/movie' do
    #     authenticate
    #     @movie = Movie.find_by(name: params[:movie_name])
    #     if @movie
    #         erb :'movies/show'        
    #     else
    #         @message = "Sorry, that movie can not be found."
    #         redirect '/home'
    #     end
    # end

end