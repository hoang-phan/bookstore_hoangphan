# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |n|
  name = "#{Faker::Commerce.department} #{ n }"
  sort_order = n
  category = Category.create(name: name,
                  sort_order: sort_order)
end


AdminUser.create(email:"test@test.com", password: "password", password_confirmation: "password")

if ENV["users"] || ENV["max"]
  5.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    phone = Faker::PhoneNumber.phone_number
    user = User.new(full_name: name,
                   email: email,
                   password: password,
                   phone: phone,
                   birthday: "22/01/1992")
    user.skip_confirmation!
    user.save!
    user.orders.create()
  end
end

if ENV["books"] || ENV["max"]
  Category.all.each do |category|
    8.times do
      title = Faker::Company.name
      description = Faker::Lorem.paragraph
      author_name = Faker::Name.name
      publisher_name = Faker::Commerce.color
      unit_price = rand(10) / 3
      photo = "cover#{ rand(5) }.jpg"
      published_date = rand(2.months).ago
      book = Book.create(title: title,
                  description: description,
                  author_name: author_name,
                  publisher_name: publisher_name,
                  unit_price: unit_price,
                  published_date: published_date,
                  photo: photo)
      category.book_category_items.create!(book_id: book.id)
      4.times do |n|
        content = Faker::Lorem.paragraph
        rating = rand(6)
        user = User.find_by_email("example-#{ n + 1 }@railstutorial.org")
        book.comments.create(rating: rating, content: content, user_id: user.id)
      end
    end
  end
end

if ENV["orders"] || ENV["max"]
  5.times do
    shipping_address = Faker::Address.street_address
    order = Order.create(shipping_address: shipping_address, order_date: "21/6/2014")
    4.times do
      book = Book.order("RANDOM()").first
      order.order_lines.create(book_id: book.id)
    end
    User.find_by_email("example-#{ 1 + rand(5) }@railstutorial.org").orders << order
  end
end







