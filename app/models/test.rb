class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :level, -> (level) { where("level = ?", level) }
  scope :level_easy, -> { where(level: (0..1)) }
  scope :level_average, -> { where(level: (2..4)) }
  scope :level_advanced, -> { where(level: (5..Float::INFINITY)) }

  def self.category(title)
    Category.find_by(title: title).tests.order('title DESC').pluck(:title)
  end
end
