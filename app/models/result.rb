class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_one :current_question, class_name: "Question"
end
