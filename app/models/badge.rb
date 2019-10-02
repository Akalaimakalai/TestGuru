class Badge < ApplicationRecord

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements
  has_one_attached :image

  validates :title, presence: true
  validates :title, uniqueness: true

  def conditions
    [
      [ "Пройти все тесты категории: ", "category_complited" ],
      [ "Пройти все тесты уровня: ", "level_complited" ],
      [ "Сдать первый тест", "first_success" ],
      [ "Завалить первый тест", "first_fail" ]
    ]
  end
end
