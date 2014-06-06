require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I have a user$/ do
  @user = FactoryGirl.create(:user)
end

Given /^on page of the first user$/ do
  visit(user_path(id: User.first.id))
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
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
  click_button "Login"
end

Then /^I should see my email$/ do
  page.should have_content(@user.email)
end

Then /^I should see div "([^\"]*)"$/ do |text|
  page.should have_selector("div.#{text}")
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

