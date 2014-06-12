class SearchController < ApplicationController
  def index
    @search = Sunspot.search(Book) do
      fulltext params[:search]
    end
    session[:per_page] ||= 8
    if params[:category_id] != "-1"
      category = Category.find(params[:category_id])
      @books = category.books.where(id: @search.results.map(&:id)).page(params[:page]).per(session[:per_page])
    else
      @books = Book.where(id: @search.results.map(&:id)).page(params[:page]).per(session[:per_page])
    end
    @category_title = "Search results"
    @title = "Search results"
    render 'books/index'
  end
end
