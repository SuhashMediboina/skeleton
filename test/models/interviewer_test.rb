require 'test_helper'

class InterviewerTest < ActiveSupport::TestCase

  def setup
    create_answers_and_ratings
  end

  test "interviewer should have next scheduled interviews ready" do
    interviewer = interviewers(:warehouse)
    assert interviewer.upcoming_interview_schedule.any?
    assert_equal interviewer.upcoming_interview_schedule.count, 2
    assert_equal interviewer.upcoming_interview_schedule.first[:interview][:position], 'Forklift Driver'
    assert_equal interviewer.upcoming_interview_schedule.first[:interview][:description], 'Interviewing Bill Snakey for the forklift driver position'
    assert_equal interviewer.upcoming_interview_schedule.first[:candidate][:name], 'Bill Snakey'
    assert interviewer.upcoming_interview_schedule.first[:questions_list].any?
  end

end
