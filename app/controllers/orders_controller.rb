class OrdersController < ApplicationController
  def index
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @showcart = true
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(order_params)
      session[:order_id] = Order.create.id
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
