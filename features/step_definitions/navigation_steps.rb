require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am an admin$/ do
  @admin = AdminUser.create(email:"test1@test.com", password: "password", password_confirmation: "password")
end

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

Given /^more than (\d+) hours passes$/ do |num|
  Timecop.freeze(Time.now + num.to_i.hours + 1.minute)
end

Given /^I am signed in with provider "(.*?)"$/ do |provider|
  visit "/users/auth/#{provider.downcase}"
end

When /^I click button "(.*?)"$/ do |button|
  click_button(button)
end

When /^I click link "(.*?)"$/ do |button|
  click_link(button)
end

When /^I click image link "(.*?)"$/ do |button|
  page.find(:css, "#{button}", match: :first).click
end

When /^I select "(.*?)" from "(.*?)"$/ do |tag, select|
  page.select(tag, from: select)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |label, value|
  fill_in label, with: value
end

When /^I sign in$/ do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When /^I login$/ do
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_button "Login"
end

When /^I confirm$/ do
  page.driver.browser.switch_to.alert.accept
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

When /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
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

Then /^I should not see link "([^\"]*)"$/ do |text|
  page.should_not have_link(text)
end

Then /^I should receive a confirmation email to "(.*?)"$/ do |email|
  user = User.new(email: email)
  mail = UserMailer.send_activation(user)
  mail.should have_content("Welcome")
end

