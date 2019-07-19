class User < ApplicationRecord
  def progress(level)
    tests = User.joins('JOIN results ON users.id = results.user_id').where(id: id).pluck(:test_id)
    Test.where(id: tests, level: level)
  end
end
