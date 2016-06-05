class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def articles
    @category = Category.find(params[:id])
    @articles = Article.where(category_id: @category.id)
  end
end
