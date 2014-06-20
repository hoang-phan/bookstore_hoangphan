class Order < ActiveRecord::Base

  belongs_to :user

  has_one :paying
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

  def build_purchase
    order_lines.map { | item | {
      name: item.book.title, description: item.book.author_name,
      quantity: "#{item.quantity}", amount: item.book.unit_price * 100
      } }
  end

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    response.success?
  end

  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "#{ first_name } #{ last_name }",
        :address1 => shipping_address,
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def price_in_cents
    (total_price * 100).round
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :brand               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => 12,
      :year               => 2100,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end

  def update_with_ip(params, ip)
    params[:ip_address] = ip
    update_attributes(params)
  end
end
