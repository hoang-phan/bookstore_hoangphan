class BooksController < ApplicationController

  def index
    session[:per_page] ||= 8
    @books = Book.order("total_rating_value DESC").page(params[:page]).per(session[:per_page])
    @category_title = "All categories"
    @title = "All books"
  end

  def show
    @book = Book.find(params[:id])
  end

  def rating
    rating = Integer(params[:rating])
    book = Book.find(params[:book_id])
    book.add_rating(rating)
    respond_to do |format|
      format.html { redirect_to book }
      format.json { render :show, status: :rating, location: book }
    end
  end

  def change_per_page
    session[:per_page] = params[:per_page]
    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { render :books, status: :change_per_page, location: books_path }
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { render :books, status: :destroy, location: books_path }
    end
  end
end
