class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  include PgSearch

  has_many :book_category_items, dependent: :destroy
  has_many :categories, through: :book_category_items

  has_many :order_lines
  has_many :comments

  multisearchable :against => [:title, :author_name]

  def to_param
    "#{title}".parameterize
  end

  def add_rating(rate)
    rating = Integer(rate)
    increment(:total_rating_count)
    increment(:total_rating_value, rating)
    save!
  end

end
