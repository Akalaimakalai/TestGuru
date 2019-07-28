class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :works, class_name: "Test", foreign_key: "author_id"
  has_many :tests, through: :results

  def progress(level)
    return tests.where(level: level) if level.class == Integer

    Test.send("level_#{level}").where(id: tests.pluck(:id))
  end
end
