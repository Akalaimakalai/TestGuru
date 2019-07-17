class Test < ApplicationRecord
  def self.category(title)
    category = Category.find_by(title: title)
    list = self.where(category_id: category.id).pluck(:title)
    puts list
  end
end
