class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:play, :submit]
  before_action :set_quiz, only: [:show, :play, :submit]

  def index
    @quizzes = Quiz.includes(:questions).order(created_at: :desc)
  end
  def show
  end

  def play
    @questions = @quiz.questions.shuffle
  end

  def submit
    answers = params[:answers] || {}
    @score  = 0
    @total  = @quiz.questions.count

    @quiz.questions.each do |question|
      given = answers[question.id.to_s]

      case question.question_type
      when "msq" # multiple choice
        correct_opt = question.options.find_by(correct: true)
        @score += 1 if correct_opt && given.to_s == correct_opt.id.to_s
      when "true_false"
        @score += 1 if given.to_s.downcase == question.correct_answer.to_s.downcase
      when "text"
        @score += 1 if given.to_s.strip.downcase == question.correct_answer.to_s.strip.downcase
      end
    end

  end

  private

  def set_quiz
    @quiz = Quiz.includes(questions: :options).find(params[:id])
  end
end
