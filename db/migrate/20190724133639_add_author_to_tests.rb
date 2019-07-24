class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :author_id, :integer
    add_foreign_key :tests, :users, column: :author_id, primary_key: "id"
    add_index :tests, :author_id
  end
end
