Given /^I am on the login page$/ do
  visit '/admin'
end

When /^I submit my username and password$/ do
  fill_in :name, :with => :admin
  fill_in :password, :with => :admin
  click_button :login
end

Then /^I should be on admin page$/ do
  
end