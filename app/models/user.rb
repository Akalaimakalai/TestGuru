class User < ApplicationRecord
  def progress(level)
    Test.joins('JOIN results ON tests.id = results.test_id').where('results.user_id = :user_id AND tests.level = :level', user_id: id, level: level)
  end
end
