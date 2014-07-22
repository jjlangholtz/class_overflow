class AnswersController < ApplicationController
  respond_to :html
  def new
    @answer = Answer.new
    respond_with @answer
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save
    flash[:notice] = 'Answer Added'
    respond_with @answer, location: questions_path
  end

  private
  def answer_params
    params.require(:answer).permit :content
  end
end
