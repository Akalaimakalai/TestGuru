class AddQuestionAssociationToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :correct_questions, :integer, default: 0
    add_reference :results, :current_question, foreign_key: {to_table: :questions}
  end
end
