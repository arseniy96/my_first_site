class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def articles
    @category = Category.find(params[:id])
    @articles = Article.where(category_id: @category.id)
  end

  def questions
    @category = Category.find(params[:id])
    @questions = Question.where(category_id: @category.id)
  end
end
