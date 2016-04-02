class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render action: 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:text, :username)
  end
end
