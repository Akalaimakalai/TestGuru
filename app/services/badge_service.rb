class BadgeService

  CONDITIONS = [ "category_complited?",
                 "level_complited?",
                 "first_success?",
                 "first_fail?"
  ]

  def initialize(result)
    @result = result
    @results = result.user.results
  end

  def start_checking
    badges = []
    Badge.all.each do |b|
      badges << b if self.send(b.condition, b)
    end
    badges
  end

  private

  def first_success?(_badge)
    @result.pass? && @results.count <= 1
  end

  def first_fail?(_badge)
    !@result.pass? && @results.count <= 1
  end

  def category_complited?(badge)
    return unless @result.pass?
    category_id = badge.additional_condition.to_i
    return if @result.test.category_id != category_id
    additional_comleted?(Test.where(category_id: category_id))
  end

  def level_complited?(badge)
    return unless @result.pass?
    additional_comleted?(Test.level(badge.additional_condition.to_i))
  end

  def additional_comleted?(tests)
    tests_ids = tests.ids
    successes_ids = @results.successes.pluck(:test_id).uniq
    check_list = []

    tests_ids.each do |t|
      check_list << t if successes_ids.include?(t)
    end

    check_list == tests_ids
  end
end
