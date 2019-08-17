class Question < ApplicationRecord
  belongs_to :test
  has_many :current_question, class_name: "Result"
  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
