class Badge < ApplicationRecord

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements
  has_one_attached :image

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :condition, presence: true
  validates :condition, inclusion: { in: BadgeService::CONDITIONS }
end
