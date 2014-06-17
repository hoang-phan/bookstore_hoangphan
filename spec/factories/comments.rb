# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    rating 1
    content "MyText"
    user nil
    book nil
  end
end
