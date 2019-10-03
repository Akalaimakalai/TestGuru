module BadgesHelper

  def description(badge)

    first = badge.condition
    second = badge.additional_condition.to_i

    if first == "category_complited?"
      I18n.t(".#{first}", additional: Category.find(second).title)
    elsif first == "level_complited?"
      I18n.t(".#{first}", additional: second)
    else
      I18n.t(".#{first}")
    end
  end
end
