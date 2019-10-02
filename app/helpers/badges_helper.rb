module BadgesHelper

  def description(badge)

    descriptions = {
      category_complited: "Пройти все тесты категории:",
      level_complited: "Пройти все тесты уровня:",
      first_success: "Успешно сдать свой первый тест",
      first_fail: "Благополучно завалить свой первый тест"
    }

    first = badge.condition.to_sym
    second = badge.additional_condition.to_i

    if first == :category_complited
      "#{ descriptions[first] } #{ Category.find(second).title }"
    elsif first == :level_complited
      "#{ descriptions[first] } #{ second }"
    else
      "#{ descriptions[first] }"
    end
  end
end
