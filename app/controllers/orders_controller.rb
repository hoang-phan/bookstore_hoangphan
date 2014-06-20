class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def index
    @orders = Order.where("user_id = ? AND id <> ?", current_user.id, session[:order_id])
      .page(params[:page]).per(5)
  end

  def show
    @order1 = Order.find(params[:id])
  end

  def edit
    @showcart = true
  end

  def update
    if !@order.update_with_ip(order_params, request.remote_ip)
      render 'edit'
    elsif @order.purchase
      redirect_to orders_success_path
    else
      redirect_to orders_failure_path
    end
  end

  def paypal
    if @order.update_with_ip(order_params, request.remote_ip)
      items = @order.build_purchase
      redirect_to express_checkout(items)
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

  def success
    session[:order_id] = current_user.orders.create.id
  end

  def failure
  end

  private

    def order_params
      params.require(:order).permit(:shipping_address, :order_date,
        :card_type, :card_number, :card_verification, :card_expire_month, :card_expire_year)
    end

    def express_checkout(items)
      response = EXPRESS_GATEWAY.setup_purchase(@order.total_price * 100,
        ip: request.remote_ip,
        return_url: orders_success_url,
        cancel_return_url: orders_failure_url,
        currency: "USD",
        allow_guest_checkout: true,
        items: items
      )
      EXPRESS_GATEWAY.redirect_url_for(response.token)
    end
end
