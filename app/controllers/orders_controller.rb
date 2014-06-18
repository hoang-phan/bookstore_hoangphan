class OrdersController < ApplicationController
  def index
    @orders = Order.where("user_id = ? AND id <> ?", current_user.id, session[:order_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @showcart = true
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(order_params)
      session[:order_id] = Order.create(user_id: current_user.id).id
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to books_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def order_params
      params.require(:order).permit(:shipping_address, :order_date)
    end
end
