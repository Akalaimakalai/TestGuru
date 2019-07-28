class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.belongs_to :user
      t.belongs_to :test

      t.timestamps
    end
  end
end
