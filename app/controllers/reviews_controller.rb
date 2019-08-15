class ReviewsController < ApplicationController

    get '/reviews/new' do
        authorize
        erb :'reviews/new'
    end
  
    post '/reviews' do
        authorize
        @movie = Movie.find_or_create_by(name: params[:movie_name].capitalize)
        @review = MovieReview.create(user: current_user, rate: params["rate"], content: params["review"], movie: @movie)
        if @review
            redirect '/reviews'
        else
            @message = "Ooops, something went wrong, try again."
            erb :'reviews/new'
        end
    end

    get '/reviews' do
        redirect '/login' if !logged_in?
        @reviews = current_user.movie_reviews
       
        erb :'reviews/index'
    end


    get '/reviews/:id/edit' do
        authorize
        @review = MovieReview.find_by(id: params[:id])
        if @review
            erb :'reviews/edit'
        else
            erb :error
        end
    end

    patch '/reviews/:id' do
        authorize
        @review = MovieReview.find_by(id: params[:id])
        @review.update(rate: params["rate"], content: params["review"])
        
        redirect '/reviews'
    end

    delete '/reviews/:id' do
        authorize
        @review = MovieReview.find_by(id: params[:id])
        if @review.present?
            @review.destroy
        end
        redirect '/reviews'
    end


end