class UsersController < ApplicationController
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
    params.require(:user).permit(:name, :profile_image)
  end
end
