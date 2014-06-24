class BooksController < ApplicationController

  def index
    session[:per_page] ||= 8
    @books = Book.page(params[:page]).per(session[:per_page])
    @category_title = "All categories"
    @title = "All books"
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue
      @book = Book.friendly.find(params[:id])
    end
  end

  def change_per_page
    session[:per_page] = params[:per_page]
    respond_to do |format|
      format.html { redirect_to books_path }
      format.json { render :books, status: :change_per_page, location: books_path }
    end
  end
end
