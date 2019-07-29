class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :question, presence: true

  validate :vatedate_answers, on: :update

  private

  def vatedate_answers
    errors.add(:count, "Wrong number of answers") if (answers.length > 4) || (answers.length < 1)
  end
end
