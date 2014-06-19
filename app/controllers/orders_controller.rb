class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
    @orders = Order.where("user_id = ? AND id <> ?", current_user.id, session[:order_id]).page(params[:page]).per(5)
  end

  def show
    @order1 = Order.find(params[:id])
  end

  def edit
    @showcart = true
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(order_params)
      session[:order_id] = Order.create(user_id: current_user.id).id
      redirect_to @order.paypal_url(books_url)
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
