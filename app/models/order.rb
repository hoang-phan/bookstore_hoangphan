class Order < ActiveRecord::Base

  belongs_to :user

  has_many :books, through: :order_lines
  has_many :order_lines, dependent: :destroy
  validate :order_date_is_date

  def add_book(book_id)
    current_item = order_lines.find_by(book_id: book_id)

    if current_item
        current_item.quantity += 1
    else
        current_item = order_lines.build(book_id: book_id)
    end

    current_item
  end

  def total_price
    order_lines.to_a.sum { |item| item.total_price }
  end

  def total_quantity
    order_lines.to_a.sum { |item| item["quantity"] }
  end

  def order_date_is_date
    errors.add(:order_date, "is invalid") unless Chronic.parse(order_date)
  end

  def paypal_url(return_url)
    values = {
      :business => 'hoangphanbk10@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    order_lines.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.book.unit_price,
        "item_name_#{index+1}" => item.book.title,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
