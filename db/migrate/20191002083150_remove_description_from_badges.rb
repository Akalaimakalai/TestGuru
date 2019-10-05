class RemoveDescriptionFromBadges < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :description
  end
end
