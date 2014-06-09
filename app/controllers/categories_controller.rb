class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:sort_order)
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books
  end
end
