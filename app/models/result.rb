class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question
  before_validation :before_validation_set_duration

  scope :successes, -> { where(percent: 85.0..100.0) }

  attr_reader :q_number, :flash_type, :flash_message

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.percent = calculate_result

    if duration && Time.now >= duration
      current_question = nil
      @flash_type = "alert"
      @flash_message = "Время вышло"
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def pass?
    calculate_result >= 85
  end

  def set_q_number
    @q_number = test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def calculate_result
    ((self.correct_questions.to_f / self.test.questions.count.to_f) * 100).round(1)
  end

  def calculate_percent
    percent = ((@q_number - 1).to_f / test.questions.count.to_f) * 100
    "#{percent.to_i}%"
  end

  private

  def correct_answer?(answer_ids)
    (!answer_ids.nil?) && (correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort)
  end

  def correct_answers
    current_question.answers.all_correct
  end

  def before_validation_set_current_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first unless current_question.nil?
    end
  end

  def before_validation_set_duration
    self.duration ||= Time.now + (self.test.timer * 60) if self.test.timer
  end
end
