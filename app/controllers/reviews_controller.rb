class ReviewsController < ApplicationController

    get '/reviews/new' do
        authorize
        erb :'reviews/new'
    end
  
    post '/reviews' do
        authorize
        @movie = Movie.find_or_create_by(name: clean(params[:movie_name].capitalize))
        @review = MovieReview.create(user: current_user, rate: params["rate"], content: clean(params["review"]), movie: @movie)
        
        if !@review.errors.any?
            redirect '/reviews'
        else
            
            erb :'reviews/new'
        end
    end

    get '/reviews' do
        authorize
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
        @review.update(rate: params["rate"], content: clean(params["review"]))
        if !@review.errors.any?
            redirect '/reviews'
        else
            erb :'reviews/edit'
        end
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