class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question

  attr_reader :percent
  attr_reader :q_number

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def pass?
    calculate_result
    if @percent >= 85
      true
    else
      false
    end
  end

  def set_q_number
    @q_number = test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.all_correct
  end

  def before_validation_set_current_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def calculate_result
    @percent = (self.correct_questions.to_f / self.test.questions.count.to_f) * 100
  end
end
