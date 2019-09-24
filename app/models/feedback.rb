class Feedback
  include ActiveModel::Model

  attr_accessor :from, :email, :body

  validates :from, presence: true
  validates :email, presence: true
  validates :body, presence: true
end
