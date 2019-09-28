class Badge < ApplicationRecord

  has_many :results
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true

  def check(result)
    send(condition, result)
  end

  private

  def first_success(result)
    id if (result.user.results.count <= 1) && result.pass?
  end

  def first_fail(result)
    id if (result.user.results.count <= 1) && (result.pass? == false)
  end
end
