module CurrentOrder
  extend ActiveSupport::Concern

  def set_order
    check_order
    begin
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      if current_user
        @order = Order.create(user_id: current_user.id)
        session[:order_id] = @order.id
        session[:expires_at] = 30.days.from_now
      else
        session[:order_id] = Order.create.id
        session[:expires_at] = 3.hours.from_now
      end
    end
  end

  def attach_order_to_user
    current_user.orders << Order.find(session[:order_id])
    session[:expires_at] = 30.days.from_now
  end

  private
    def check_order
      if session[:order_id] && session[:expires_at] < Time.now
        begin
          Order.destroy(session[:order_id])
        rescue
        end
        session.delete(:order_id)
      end
    end
end