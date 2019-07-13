class AddTestsNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:tests, :test, false)
    change_column_null(:tests, :level, false)
  end
end
