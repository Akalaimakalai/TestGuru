class AddTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer
    add_column :results, :duration, :datetime
  end
end
