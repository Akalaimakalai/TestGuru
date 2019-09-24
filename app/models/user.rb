class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :works, class_name: "Test", foreign_key: "author_id"
  has_many :tests, through: :results
  has_many :gists

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def progress(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
