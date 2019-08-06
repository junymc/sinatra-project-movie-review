class CreateMovieReview < ActiveRecord::Migration
  def change
    create_table :movie_review do |t|
      t.string :content
      t.integer :rate
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end
  end
end
