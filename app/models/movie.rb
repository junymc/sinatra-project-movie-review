class Movie < ActiveRecord::Base
    has_many :movie_reviews
    has_many :users, through: :movie_reviews
end