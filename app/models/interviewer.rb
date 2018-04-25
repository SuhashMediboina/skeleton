class Interviewer < ApplicationRecord
  has_many :answer_ratings
  has_many :interview_participants
  has_many :interviews, through: :interview_participants

  def upcoming_interview_schedule
    next_interviews(2).map do |interview|
      {
        interview: {
          description: interview.description,
          position: interview.position.name,
          position_description: interview.position.description
        },
        candidate: {
          name: interview.candidate.name,
          email: interview.candidate.email,
          phone: interview.candidate.phone
        },
        questions_list: interview.questions.pluck(&:question)
      }
    end
  end

  def next_interviews(limit = 1)
    interviews.where('interview_date >= ?', Time.now).limit(limit)
  end

end
