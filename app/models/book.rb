class Book < ActiveRecord::Base

  has_many :book_category_items
  has_many :categories, through: :book_category_items

end
