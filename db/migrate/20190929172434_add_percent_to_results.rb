class AddPercentToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :percent, :float
  end
end
