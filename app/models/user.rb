require 'digest/sha1'

class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :works, class_name: "Test", foreign_key: "author_id"
  has_many :tests, through: :results

  validates :email, format: /@/, uniqueness: true, case_sensitive: false

  has_secure_password

  def progress(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test: test)
  end
end
