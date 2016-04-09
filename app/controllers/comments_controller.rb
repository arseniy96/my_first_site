class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]

  def create
    if params[:article_id] != nil
      @art = Article.find(params[:article_id])
      @article = @art.comments.new(comments_params)
      @article.username = current_user.username
      @article.save

      redirect_to article_path(@art)
    elsif params[:question_id] != nil
      @ques = Question.find(params[:question_id])
      @question = @ques.comments.new(comments_params)
      @question.username = current_user.username
      @question.save

      redirect_to question_path(@ques)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
