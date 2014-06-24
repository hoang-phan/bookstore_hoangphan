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

  def total_rating_count
    comments.count
  end

  def total_rating_value
    comments.to_a.sum { |item| item[:rating] }
  end

end
