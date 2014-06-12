class Cart < ActiveRecord::Base
  has_many :books, through: :line_items
  has_many :line_items, dependent: :destroy
end
