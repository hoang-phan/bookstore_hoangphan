class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:sort_order)
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books.page(params[:page]).per(session[:per_page])
  end

  def search
    @category = Category.find(params[:id])
    @books = @category.books.search(params[:search]).page(params[:page]).per(session[:per_page])
    render "books/index"
  end

end
