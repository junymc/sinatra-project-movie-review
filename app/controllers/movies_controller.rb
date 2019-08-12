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
        @movie = Movie.find(params[:id])
        erb :'movies/show'
    end

end