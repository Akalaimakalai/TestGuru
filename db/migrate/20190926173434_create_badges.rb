class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :badges, :title, unique: true
    add_belongs_to :results, :badge
  end
end
