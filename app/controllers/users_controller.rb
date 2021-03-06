class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @page = 'Profile'
    @user = User.find(params[:id])
    @articles = Article.includes(:user)
    @questions = Question.includes(:user)
  end

  def edit
    @user = User.find(params[:id])
    if !(user_signed_in?) or current_user.username != @user.username
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  def articles
    @user = User.find(params[:id])
    @articles = Article.includes(:user)
    @page = "#{@user.username} articles"
  end

  def questions
    @user = User.find(params[:id])
    @questions = Question.includes(:user)
    @page = "#{@user.username} questions"
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :email, :username)
  end
end
