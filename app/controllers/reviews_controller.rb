class ReviewsController < ApplicationController

    get '/reviews/new' do
        
        erb :'reviews/new'
    end

    post '/reviews' do

        redirect '/movies'
    end

    get '/reviews/:id' do
         
    end

    get 'reviews/:id/edit' do

    end

    patch '/reviews/:id'


end