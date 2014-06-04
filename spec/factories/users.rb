# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    full_name "Avenger"
    email "ex@fellow.com"
    password "password"
    password_confirmation "password"
    birthday "2014-06-04"
    phone "01239330268"
  end
end
