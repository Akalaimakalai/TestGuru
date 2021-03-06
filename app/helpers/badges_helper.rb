module BadgesHelper

  def conditions
    BadgeService::CONDITIONS.map do |condition|
      [ I18n.t(".#{condition}", additional: nil), condition ]
    end
  end

  def description(badge)

    first = badge.condition
    second = badge.additional_condition.to_i

    if first == "category_complited?"
      I18n.t(".#{first}", additional: Category.find(second).title)
    elsif first == "level_complited?"
      I18n.t(".#{first}", additional: second)
    else
      I18n.t(".#{first}", additional: nil)
    end
  end
end
