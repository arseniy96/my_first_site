class CommentsController < ApplicationController
  def create
    if params[:article_id] != nil
      @article = Article.find(params[:article_id])
      @article.comments.new(comments_params)
      @article.save
      redirect_to article_path(@article)
    elsif params[:question_id] != nil
      @question = Question.find(params[:question_id])
      @question.comments.new(comments_params)
      @question.save
      redirect_to question_path(@question)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
