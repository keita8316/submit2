class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'successfully update.'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'error! not successfully update.'
      redirect_to edit_user_path(@user)  
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
