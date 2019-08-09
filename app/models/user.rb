class User < ActiveRecord::Base
    has_secure_password
    has_many :movie_reviews
    has_many :movies, through: :movie_reviews
    validates :username, presence: true, uniqueness: true
end