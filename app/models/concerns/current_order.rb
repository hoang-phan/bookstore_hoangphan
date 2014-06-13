module CurrentOrder
  extend ActiveSupport::Concern

  def set_order
    begin
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      @order = Order.create
      session[:order_id] = @order.id
    end
  end
end