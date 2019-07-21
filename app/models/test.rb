class Test < ApplicationRecord
  def self.category(title)
    self.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', title).order('tests.title desc').pluck(:title)
  end
end
