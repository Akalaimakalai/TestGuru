class Badge < ApplicationRecord

  has_many :results
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
