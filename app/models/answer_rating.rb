class AnswerRating < ApplicationRecord
  belongs_to :answer
  belongs_to :interviewer

  scope :valid_ratings, -> { where('rating > 0') }
end