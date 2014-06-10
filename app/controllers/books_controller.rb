class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 5)
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 5)
    render 'index'
  end

end
