class QuestionsController < ApplicationController
  def index
    @page = 'Questions'
    @questions = Question.order('created_at DESC')
  end

  def show
    @page = 'Question'
    @question = Question.find(params[:id])
  end

  def create
    @questions = Question.order('created_at DESC')
    @question = Question.new(question_params)
    @question.username = current_user.username if user_signed_in?
    if @question.save
      redirect_to @question
    else
      @error = @question.errors.full_messages.first
      render action: 'index'
    end
  end

  def edit
    @page = 'Edit Question'
    @question = Question.find(params[:id])
    if !(user_signed_in?) or current_user.username != @question.username
      redirect_to question_path
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      @error = @question.errors.full_messages.first
      render action: 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question, :username)
  end
end
