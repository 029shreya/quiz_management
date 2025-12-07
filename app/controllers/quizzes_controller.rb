class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

  def show
    @quiz = Quiz.includes(questions: :options).find(params[:id])
  end

  def submit
    @quiz = Quiz.includes(questions: :options).find(params[:id])

    answers = params[:answers] || {}
    @score  = 0
    @total  = @quiz.questions.count

    @quiz.questions.each do |question|
      given = answers[question.id.to_s]

      if question.msq?
        correct_option_id = question.options.find_by(correct: true)&.id&.to_s
        @score += 1 if given == correct_option_id
      elsif question.true_false?
        @score += 1 if given.to_s.downcase == question.correct_answer.to_s.downcase
      elsif question.text?
        @score += 1 if given.to_s.strip.downcase == question.correct_answer.to_s.strip.downcase
      end
    end
  end
end
