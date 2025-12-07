class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.order(created_at: :desc)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def submit
    @quiz = Quiz.find(params[:id])
  end
end
