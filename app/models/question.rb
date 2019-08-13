class Question < ApplicationRecord
  belongs_to :test
  belongs_to :current_question, class_name: "Result"
  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
