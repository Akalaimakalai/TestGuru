class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.category(title)
    Category.find_by(title: title).tests.order('title DESC')
  end
end
