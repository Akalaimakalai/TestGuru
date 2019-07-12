class AddTestsLevelDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, from: 0, to: 0)
  end
end
