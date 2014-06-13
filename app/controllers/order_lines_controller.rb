class OrderLinesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @order_line = @order.add_book(book.id)
    is_new = @order_line.quantity == 1

    respond_to do |format|
      if @order_line.save
        msg = { book: book, amount: @order_line.quantity, total_price: @order_line.total_price,
          subtotal: @order.total_price, quantity: @order.total_quantity, is_new: is_new }
        format.json  { render json: msg }
      else
        format.json  { render json: nil }
      end
    end
  end

  def order_line_params
      params.require(:order_line).permit(:book_id)
    end
end
