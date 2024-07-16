class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]
  def show
    @user = User
    @book = Book.new
    @books = User.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      flash[:notice] = "You have updated user successfully."
      redirect_to new_book_path
    else
      render :new
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end 
  end 
  
end
