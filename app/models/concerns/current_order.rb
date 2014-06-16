module CurrentOrder
  extend ActiveSupport::Concern

  def set_order
    begin
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      if current_user
        @order = Order.create(user_id: current_user.id)
        session[:order_id] = @order.id
      end
    end
  end
end