class Test < ApplicationRecord
  def self.category(title)
    n = Category.find_by(title: title).id
    where(category_id: n).order('title desc').pluck(:title)
  end
end
