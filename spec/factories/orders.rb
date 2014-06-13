# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_date "2014-06-13"
    order_total_amount "9.99"
    user nil
    shipping_address "MyString"
  end
end
