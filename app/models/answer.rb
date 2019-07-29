class Answer < ApplicationRecord
  belongs_to :question

  scope :all_correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_question, if: :question_id

  private

  def validate_question
    errors.add(:count, "Too many answers") if question.answers.length >= 4
  end
end
