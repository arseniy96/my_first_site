class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.includes(:user)
    @questions = Question.includes(:user)
  end
end
