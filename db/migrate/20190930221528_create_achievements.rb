class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.belongs_to :user
      t.belongs_to :badge

      t.timestamps
    end

    remove_column :results, :badge_id
  end
end
