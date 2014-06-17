require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I have a user$/ do
  @user = FactoryGirl.create(:user)
  @user.confirm!
end

Given /^I have a book$/ do
  @book = FactoryGirl.create(:book)
end

Given /^I have a category$/ do
  @category = FactoryGirl.create(:category)
end

Given /^the book belongs to the category$/ do
  @category.book_category_items.create!(book_id: @book.id)
end

Given /^on page of the first user$/ do
  visit(user_path(id: User.first.id))
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I visit the book page$/ do
  visit "books/#{ @book.id }"
end

Given /^I visit the category page$/ do
  visit "categories/#{ @category.id }"
end

When /^I click button "(.*?)"$/ do |button|
  click_button(button)
end

When /^I click link "(.*?)"$/ do |button|
  click_link(button)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |label, value|
  fill_in label, with: value
end

When /^I sign in$/ do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When /^I sign in fail$/ do
  fill_in "Email", with: @user.email
  fill_in "Password", with: "Wrong"
  click_button "Sign in"
end

When /^I sign in fail (.*?) times$/ do |t|
  Integer(t).times { step "I sign in fail" }
end

When /^I do not verify captcha$/ do
  SessionsController.any_instance.stub(:verify_recaptcha) { false }
end

When /^I verify captcha$/ do
  SessionsController.any_instance.stub(:verify_recaptcha) { true }
end

Then /^I should see my email$/ do
  page.should have_content(@user.email)
end

Then /^I should see div "([^\"]*)"$/ do |text|
  page.should have_selector("div.#{text}")
end

Then /^I should see content of the book$/ do
  page.should have_content(@book.title)
end

Then /^I should see content of the first user$/ do
  user = User.first
  page.should have_content(user.email)
end

Then /^I should see content "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see content "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see title "([^\"]*)"$/ do |text|
  page.should have_title(text)
end

Then /^I should see link "([^\"]*)"$/ do |text|
  page.should have_link(text)
end

Then /^I should receive a confirmation email to "(.*?)"$/ do |email|
  user = User.new(email: email)
  mail = UserMailer.send_activation(user)
  mail.should have_content("Welcome")
end

