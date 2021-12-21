class BookCommentsController < ApplicationController
    
    def create
        #@user = User.find(current_user.id)
       # book = Book.find(params[:book_id])
        #comment = current_user.book_comments.new(book_comment_params)
       # comment.book_id = book.id
       # if comment.save
        #  flash[:success] = 'Book was successfully create.'
        #else
         # flash[:alert] = 'error!Book was not successfully created.'
        #end
        #redirect_back(fallback_location: root_path)
        
        @book = Book.find(params[:book_id])
        @book_comment = @book.book_comments.new(comment_params)
        @book_comment.user_id = current_user.id
        if @book_comment.save
          redirect_back(fallback_location: root_path)
        else
          @book_new = Book.new
          @book_comments = @book.comments
          redirect_back(fallback_location: root_path)
        end
    end
    
    def destroy
        @book = Book.find(params[:book_id])
        comment = BookComment.find(params[:book_id])
        #BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        comment.destroy
        redirect_back(fallback_location: root_path)
        
    end
    
    
    private
    
    def comment_params
        params.require(:book_comment).permit(:comment)
    end
    
end