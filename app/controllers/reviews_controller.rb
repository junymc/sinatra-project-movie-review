class ReviewsController < ApplicationController

    get '/reviews/new' do
        
        erb :'reviews/new'
    end
  
    post '/review' do
        @review = MovieReview.create(rate: params["rate"], content: params["review"]) 
        
        redirect '/movies/:id'
    end


    get '/reviews/:id/edit' do
        @review = MovieReview.find_by(id: params[:id])
        erb :'reviews/edit'
    end

    patch '/reviews/:id' do
    end

    delete '/reviews/:id' do
        @review = MovieReview.find_by(id: params[:id])
        @review.destroy
        redirect '/reviews'
    end


end