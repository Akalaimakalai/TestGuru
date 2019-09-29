class Badge < ApplicationRecord

  has_many :results
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true

  def conditions
    [
      [ "Пройти все тесты категории: ", "category_complited" ]
    ]
  end

  def check(result)
    send(condition, result)
  end

  private

  def first_success(result)
    id if (result.user.results.count <= 1) && result.pass?
  end

  def first_fail(result)
    id if (result.user.results.count <= 1) && (result.pass? == false)
  end

  def category_complited(result)
    successes = result.user.results.where(percent: 85.0..100.0).pluck(:test_id)
    category_id = Category.find_by(title: "Крылатые фразы").id
    tests_ids = Test.where(category_id: category_id).pluck(:id)
    check_list = []

    tests_ids.each do |t|
      check_list << t if successes.include?(t) && !check_list.include?(t)
    end

    id if check_list == tests_ids
  end
end
