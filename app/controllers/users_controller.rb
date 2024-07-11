class UsersController < ApplicationController
  def show
    @user = User
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to new_book_path
  end
  
  def index
    @users = User.all
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
