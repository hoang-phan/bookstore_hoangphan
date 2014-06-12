class Book < ActiveRecord::Base
  has_many :book_category_items, dependent: :destroy
  has_many :categories, through: :book_category_items

  has_many :line_items

  before_destroy :ensure_no_cart_items

  # searchable do
  #   text :title, :author_name
  # end

  # def Book.search(keyword, category_id=nil)
  #   where('title LIKE :keyword OR author_name LIKE :keyword', keyword: "%#{ keyword }%")
  # end

  def add_rating(rating)
    increment!(:total_rating_count)
    increment!(:total_rating_value, rating)
    save!
  end

  private
    def ensure_no_cart_items
      return true if line_items.empty?
      errors.add(:base, 'Line Items present')
      false
    end

end
