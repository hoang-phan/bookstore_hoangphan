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
      session[:order_id] = current_user.orders.create.id
      redirect_to express_checkout
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

    def express_checkout
      items = @order.order_lines.map { | item | {
        name: item.book.title, description: item.book.author_name,
        quantity: "#{item.quantity}", amount: item.book.unit_price * 100
        } }
      response = EXPRESS_GATEWAY.setup_purchase(@order.total_price * 100,
        ip: request.remote_ip,
        return_url: books_url,
        cancel_return_url: books_url,
        currency: "USD",
        allow_guest_checkout: true,
        items: items
      )
      EXPRESS_GATEWAY.redirect_url_for(response.token)
    end
end
