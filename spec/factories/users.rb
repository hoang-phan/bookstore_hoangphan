# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    full_name "Phan Nhat Hoang"
    email "someemail@gmail.com"
    password "12345678"
    phone "01230213123"
    birthday "22/01/1992"
  end
end
