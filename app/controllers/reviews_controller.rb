class ReviewsController < ApplicationController

    get '/reviews/new' do
        
        erb :'reviews/new'
    end
  
    post '/reviews' do
       
        @review = MovieReview.create(rate: params[:rate], review: params[:content])     
        redirect '/movies/:id'
    end

    # get '/reviews/:id' do
    #     @reviews = MovieReview.all
    #     @review = MovieReview.find(params[:id])
    #     erb :'reviews/show' 
    # end

    get 'reviews/:id/edit' do
        @review = MovieReview.find(params[:id])
        erb :'/reviews/edit'
    end

    # patch '/reviews/:id'


end