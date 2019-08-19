class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    change_column_default(:users, :rang, from: nil, to: "noob")
  end
end
