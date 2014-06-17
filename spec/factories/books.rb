# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:title)  { |n| "Title#{n}" }
    description "MyText"
    author_name "MyString"
    publisher_name "MyString"
    published_date "2014-06-09"
    unit_price "9.99"
    photo "MyString"
    total_rating_count 1
    total_rating_value 1
  end
end
