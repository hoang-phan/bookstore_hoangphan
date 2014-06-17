class CommentsController < ApplicationController
  def create
    book = Book.find(comment_params[:book_id])

    respond_to do |format|
      begin
        @comment = current_user.comments.create!(book_id: book.id, content: comment_params[:content])
        book.add_rating(comment_params[:rating])
        flash[:notice] = "Thank you for rating"
        format.html { redirect_to book_path(book) }
      rescue
        flash[:error] = "You cannot comment on this book"
        format.html { redirect_to book_path(book) }
      end
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:book_id, :content, :rating)
    end
end
