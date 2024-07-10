class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @books = Book.all
  end 

  def crate
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end 
  end 

  def index
    @books = Book.all
    @user = User
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:is])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end 
  
end
