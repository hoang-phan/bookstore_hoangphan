class CommentsController < ApplicationController
  def create
    book = Book.find(comment_params[:book_id])

    begin
      @comment = current_user.comments.create!(book_id: book.id, content: comment_params[:content])
      book.add_rating(comment_params[:rating])
      flash[:notice] = "Thank you for rating"
    rescue
      flash[:error] = "You cannot comment on this book"
    end

    redirect_to book_path(book)
  end

  private
    def comment_params
      params.require(:comment).permit(:book_id, :content, :rating)
    end
end
