class BadgeService

  def initialize(result)
    @result = result
  end

  def start_checking
    Badge.all.each do |badge|
      method = badge.condition
      badge_id = self.send(method, badge)

      Achievement.create!(user_id: @result.user_id, badge_id: badge_id) unless badge_id.nil?
    end
  end

  private

  def first_success(badge)
    return unless @result.pass?
    badge.id if (@result.user.results.count <= 1)
  end

  def first_fail(badge)
    return if @result.pass?
    badge.id if (@result.user.results.count <= 1)
  end

  def category_complited(badge)
    category_id = badge.additional_condition.to_i
    return if @result.test.category_id != category_id
    successes_ids = successes_arr
    tests_ids = Test.where(category_id: category_id).pluck(:id)
    check_list = []

    tests_ids.each do |t|
      check_list << t if successes_ids.include?(t) && !check_list.include?(t)
    end

    badge.id if check_list == tests_ids
  end

  def level_complited(badge)
    lvl = badge.additional_condition.to_i
    successes_ids = successes_arr
    tests_ids = Test.level(lvl).pluck(:id)
    check_list = []

    tests_ids.each do |t|
      check_list << t if successes_ids.include?(t) && !check_list.include?(t)
    end

    badge.id if check_list == tests_ids
  end

  def successes_arr
    @result.user.results.successes.pluck(:test_id)
  end
end
