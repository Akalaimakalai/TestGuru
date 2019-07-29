class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_question, on: :create, if: :question_id

  scope :all_correct, -> { where(correct: true) }

  private

  def validate_question
    errors.add(:count, "too many answers") if question.answers.count >= 4
  end
end
