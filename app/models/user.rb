class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :works, class_name: "Test", foreign_key: "author_id"
  has_many :tests, through: :results

  def progress(level)
    tests.where(level: level)
  end
end
