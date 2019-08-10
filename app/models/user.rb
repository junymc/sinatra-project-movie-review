class User < ActiveRecord::Base
    has_secure_password
    has_many :movie_reviews
    has_many :movies, through: :movie_reviews
    validates :username, presence: true, uniqueness: true
    validates :password, length: (in: 6..10)
end