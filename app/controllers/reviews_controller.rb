class ReviewsController < ApplicationController

    get '/reviews/new' do
        authenticate
        erb :'reviews/new'
    end
  
    post '/reviews' do
        authenticate
        @movie = Movie.find_or_create_by(name: clean(params[:movie_name].capitalize))
        @review = MovieReview.create(user: current_user, rate: params["rate"], content: clean(params["review"]), movie: @movie)
        
        if !@review.errors.any?
            redirect '/reviews'
        else
            
            erb :'reviews/new'
        end
    end

    get '/reviews' do
        authenticate
        redirect '/login' if !logged_in?
        @reviews = current_user.movie_reviews
       
        erb :'reviews/index'
    end


    get '/reviews/:id/edit' do
        authenticate
        @review = MovieReview.find_by(id: params[:id])
        if @review
            erb :'reviews/edit'
        else
            erb :error
        end
    end

    patch '/reviews/:id' do
        authenticate
        @review = MovieReview.find_by(id: params[:id])
        redirect '/access_denied' if @review.user_id != current_user
        @review.update(rate: params["rate"], content: clean(params["review"]))
        #Micah's @review.id was 19
        if !@review.errors.any?
            redirect '/reviews'
        else
            erb :'reviews/edit'
        end
    end

    # get '/access_denied'
    #     @messgae = "You don't have access to this review!"
    #      erb :'users/home'
    # end

    delete '/reviews/:id' do
        authenticate
        @review = MovieReview.find_by(id: params[:id])
        redirect '/access_denied' if @review.user_id != current_user
        if @review.present?
            @review.destroy
        end
        redirect '/reviews'
    end

end