class CombineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:book_id).sum(:quantity)

      sums.each do |book_id, quantity|
        if quantity > 1
          cart.line_items.where(book_id: book_id).delete_all

          item = cart.line_items.build(book_id: book_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id, book_id: line_item.book_id, quantity: 1
      end

      line_item.destroy
    end
  end
end
