class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
    
  end
    
  def show
    @book = Book.new
    @hon = Book.find(params[:id])
    @user = User.find(current_user.id)
    @books = Book.all
    @hito = User.find(@hon.user_id)
  end
    
  def new
        
  end
    
  def create
    
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'Book was successfully create.'
      redirect_to book_path(@book)
    else
      flash[:alert] = 'error!Book was not successfully created.'
      redirect_to books_path
    end
        
  end
    
  def edit
    @book = Book.find(params[:id])
  end
    
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully update.'
      redirect_to book_path(@book)
    else
      flash[:alert] = 'error!Book was not successfully update.'
      redirect_to edit_book_path(@book)
    end
        
  end
    
  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = 'Book was successfully destroyed.'
    else
      flash[:alert] = 'error!Book was not successfully destroyed.'
    end
    redirect_to books_path
  end
    
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
