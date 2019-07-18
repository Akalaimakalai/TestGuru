class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  def progress(level)
    tests.where(level: level)
  end
end
