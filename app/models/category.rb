class Category < ActiveRecord::Base

  has_many :book_category_items
  has_many :books, through: :book_category_items

end
