class Badge < ApplicationRecord
  has_many :users, through: :results
  has_many :results

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
