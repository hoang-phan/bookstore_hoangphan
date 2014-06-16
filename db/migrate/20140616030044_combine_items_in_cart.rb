class CombineItemsInCart < ActiveRecord::Migration
  def up
    Order.all.each do |order|
      sums = order.order_lines.group(:book_id).sum(:quantity)

      sums.each do |book_id, quantity|
        if quantity > 1
          order.order_lines.where(book_id: book_id).delete_all

          item = order.order_lines.build(book_id: book_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    OrderLine.where("quantity>1").each do |order_line|
      order_line.quantity.times do
        OrderLine.create order_id: order_line.order_id, book_id: order_line.book_id, quantity: 1
      end

      order_line.destroy
    end
  end
end
