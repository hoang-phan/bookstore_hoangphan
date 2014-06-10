class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 8)
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @books = Book.search(params[:search], params[:category_id]).paginate(page: params[:page], per_page: 8)
    render 'index'
  end

end
