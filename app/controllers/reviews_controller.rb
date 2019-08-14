class ReviewsController < ApplicationController

    get '/reviews/new' do
        
        erb :'reviews/new'
    end
  
    post '/reviews' do
        @movie = Movie.find_or_create_by(name: params[:movie_name].capitalize)
        @review = MovieReview.create(user: current_user, rate: params["rate"], content: params["review"], movie: @movie)
        # binding.pry
        redirect '/reviews'
    end

    get '/reviews' do
        # binding.pry
        @reviews = current_user.movie_reviews
       
        erb :'reviews/index'
    end


    get '/reviews/:id/edit' do
        @review = MovieReview.find_by(id: params[:id])
        erb :'reviews/edit'
    end

    patch '/reviews/:id' do
        # @reviews = MovieReview.all
        @review = MovieReview.find_by(id: params[:id])
        @review.update(rate: params["rate"], content: params["review"])
        @review.save
        redirect '/reviews'
    end

    delete '/reviews/:id' do
        # @reviews = MovieReview.all
        @review = MovieReview.find_by(id: params[:id])
        if @review.present?
            @review.destroy
        end
        redirect '/reviews'
    end


end