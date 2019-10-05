class AddAdditionConditionToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :additional_condition, :string
    change_column_null(:badges, :condition, false)
  end
end
