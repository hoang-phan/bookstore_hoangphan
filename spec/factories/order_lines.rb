# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_line do
    order nil
    book nil
    quantity 1
  end
end
