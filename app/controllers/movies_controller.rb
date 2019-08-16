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

end