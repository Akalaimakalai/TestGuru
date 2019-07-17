class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :users, foreign_key: true
      t.references :tests, foreign_key: true
  
      t.timestamps
    end
  end
end
