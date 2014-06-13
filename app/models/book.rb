class Book < ActiveRecord::Base
  include PgSearch

  has_many :book_category_items, dependent: :destroy
  has_many :categories, through: :book_category_items

  has_many :order_lines

  before_destroy :ensure_no_cart_items

  multisearchable :against => [:title, :author_name]

  def add_rating(rating)
    increment!(:total_rating_count)
    increment!(:total_rating_value, rating)
    save!
  end

  private
    def ensure_no_cart_items
      return true if order_lines.empty?
      errors.add(:base, 'Line Items present')
      false
    end

end
