class User < ApplicationRecord
  def progress(level)
    user_id = self.id 
    progress = Result.where(users_id: user_id).pluck(:tests_id)
    list = Test.where(id: progress).where(level: level).pluck(:title)
    puts list
  end
end
