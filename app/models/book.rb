class Book < ActiveRecord::Base

  has_many :book_category_items
  has_many :categories, through: :book_category_items

  def Book.search(keyword, category_id=nil)
    where('title LIKE :keyword OR author_name LIKE :keyword', keyword: "%#{ keyword }%")
  end

end
