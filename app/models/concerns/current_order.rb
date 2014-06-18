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
        session[:expires_at] = 30.days.from_now.to_i
      else
        session[:order_id] = Order.create.id
        session[:expires_at] = 3.hours.from_now.to_i
      end
    end
  end

  def attach_order_to_user
    current_user.orders << Order.find(session[:order_id])
    session[:expires_at] = 30.days.from_now.to_i
  end

  private
    def check_order
      if session[:order_id] && session[:expires_at].to_i < Time.now.to_i
        begin
          Order.destroy(session[:order_id])
        rescue
        end
        session.delete(:order_id)
      end
    end
end