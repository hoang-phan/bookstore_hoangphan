class OrderLinesController < ApplicationController
  def index
    @order = current_order
  end

  def create
    book = Book.find(order_line_params[:book_id])
    @order_line = current_order.add_book(book.id)
    is_new = @order_line.quantity == 1

    respond_to do |format|
      if @order_line.save
        msg = { book: book, amount: @order_line.quantity, total_price: @order_line.total_price,
          subtotal: current_order.total_price, quantity: current_order.total_quantity, is_new: is_new }
        format.json  { render json: msg }
      end
    end
  end

  def order_line_params
    params.require(:order_line).permit(:book_id)
  end
end
