class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  def total_price
    book.unit_price * quantity
  end
end
