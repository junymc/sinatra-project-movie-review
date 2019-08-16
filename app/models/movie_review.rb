class MovieReview < ActiveRecord::Base
    belongs_to :user
    belongs_to :movie
    validates :content, presence: true
end