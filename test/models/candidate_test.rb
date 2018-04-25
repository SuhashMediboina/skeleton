require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  def setup
    create_answers_and_ratings
  end

  test "candidate should have valid answer ratings" do
    candidate = candidates(:fred_flintstone)
    assert candidate.answer_ratings.valid_ratings.any?
  end

  test "candidate should get average answer rating" do
    candidate = candidates(:fred_flintstone)
    refute candidate.average_rating.zero?
  end

  test "candidate average rating should be less if one of the ratings is 0" do
    candidate = candidates(:fred_flintstone)
    current_average_rating = candidate.average_rating.round(2)
    candidate.answer_ratings.valid_ratings.first.update_attribute(:rating, 0)
    refute_equal candidate.average_rating.round(2), current_average_rating
  end
end