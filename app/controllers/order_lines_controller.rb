class OrderLinesController < ApplicationController
  def index
    @order = current_order
  end

  def create
    current_order.add_book(order_line_params[:book_id]).save
  end

  def destroy
    @order_line = OrderLine.find(params[:id])
    @order_line.destroy
  end

  private
    def order_line_params
      params.require(:order_line).permit(:book_id)
    end
end
