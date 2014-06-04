require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I click button "(.*?)"$/ do |button|
  click_button(button)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |label, value|
  fill_in label, with: value
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