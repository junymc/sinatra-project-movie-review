class ReviewsController < ApplicationController

    get '/reviews/new' do
        
        erb :'reviews/new'
    end

    post '/reviews' do
   # after user submit the new review, it should go to '/movies' page again but not working..
        redirect '/movies'
    end

    get '/reviews/:id' do
         @reviews = MovieReview.all
        erb :'reviews/show' 
    end

    get 'reviews/:id/edit' do

    end

    # patch '/reviews/:id'


end