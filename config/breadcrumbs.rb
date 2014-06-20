crumb :root do
  link "Home", root_path
end

crumb :books do
  link "Books", books_path
end

crumb :book do |book|
  link book.title, book_path(book)
  parent :books
end

crumb :signin do |book|
  link "Sign in", new_user_session_path
end

crumb :signup do |book|
  link "Sign up", new_user_registration_path
end

crumb :checkout do |order|
  link "Checkout", edit_order_path(order)
end

crumb :modify do
  link "Modify order", order_lines_path
end

crumb :past_orders do
  link "Past orders", orders_path
  parent :modify
end

crumb :order do |order|
  link "#{ order.order_date } to #{ order.shipping_address } ", order_path(order)
  parent :past_orders
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).