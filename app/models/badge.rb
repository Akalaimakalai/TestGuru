class Badge < ApplicationRecord

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements
  has_one_attached :image

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :condition, presence: true
  
  def conditions
    [
      [ I18n.t(".category_complited?", additional: nil), "category_complited?" ],
      [ I18n.t(".level_complited?", additional: nil), "level_complited?" ],
      [ I18n.t(".first_success?"), "first_success?" ],
      [ I18n.t(".first_fail?"), "first_fail?" ]
    ]
  end
end
