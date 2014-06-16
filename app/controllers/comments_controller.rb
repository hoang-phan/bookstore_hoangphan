class CommentsController < ApplicationController
  def create
    book = Book.find(comment_params[:book_id])
    if current_user
      @comment = current_user.comments.create(book_id: book)
      book.add_rating(comment_params[:rating])
    end
    redirect_to book_path(book)
  end

  private
    def comment_params
      params.require(:comment).permit(:book_id, :title, :comment, :rating)
    end
end
