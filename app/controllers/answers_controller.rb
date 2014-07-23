class AnswersController < ApplicationController
  respond_to :html
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
    respond_with @answer
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    flash[:notice] = 'Answer Added'
    respond_with @answer, location: @question
  end

  private
  def answer_params
    params.require(:answer).permit :content
  end
end
