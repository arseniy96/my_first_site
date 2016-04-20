class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @page = 'Articles'
    @articles = Article.order('created_at DESC')
  end

  def show
    @page = 'Article'
    @article = Article.find(params[:id])
    @article.user_id = current_user.id
  end

  def new
    @page = 'New Article'
  end

  def create
    @article = Article.new(article_params)
    @article.username = current_user.username
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @page = 'Edit Article'
    @article = Article.find(params[:id])
    if !(user_signed_in?) or current_user.username != @article.username
      redirect_to article_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
