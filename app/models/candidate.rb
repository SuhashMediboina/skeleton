class Candidate < ApplicationRecord
  has_many :interviews
  has_many :positions, through: :interviews
  has_many :questions, through: :interviews
  has_many :answers
  has_many :answer_ratings, through: :answers
  
  # Average rating for all interviews the candidate attended
  def average_rating
    answer_ratings.valid_ratings.average(:rating)
  end

end