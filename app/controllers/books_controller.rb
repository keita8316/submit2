class BooksController < ApplicationController
  
  before_action :authenticate_user!
  
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
    @book_comment = BookComment.new
  end
    
  def new
        
  end
    
  def create
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'Book was successfully create.'
      redirect_to book_path(@book)
    else
      flash[:alert] = 'error!Book was not successfully created.'
      render :index
    end
        
  end
    
  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user 
      redirect_to books_path
    end
  end
    
  def update
    @book = Book.find(params[:id])
    @user = @book.user
    if @user.id == current_user.id
      
      if @book.update(book_params)
        flash[:success] = 'Book was successfully update.'
        redirect_to book_path(@book)
      else
        flash[:alert] = 'error!Book was not successfully update.'
        render :edit
      end
    else
      redirect_to books_path
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
