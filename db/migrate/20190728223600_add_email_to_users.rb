class AddEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string
    change_column_null(:users, :email, false)
    # sqlite3 взорвал мне сперва мозг, затем сидалище тем,
    # что не смог принять стороку: add_column :users, :email, :string, null: false
  end
end
