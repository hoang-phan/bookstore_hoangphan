class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:sort_order)
  end

  def show
    session[:per_page] ||= 8
    @category = Category.find(params[:id])
    @books = @category.books.page(params[:page]).per(session[:per_page])
    @category_title = @category.name
    @title = "Category #{ @category.name }"
    render 'books/index'
  end

end
