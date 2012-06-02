Given /^I am on the submit page$/ do
  visit '/'
end

Then /^I should see success message$/ do
  page.should have_content('you have submitted your information successfully')
end

When /^I fill "([^"]*)" as "([^"]*)"$/ do |field, value|
  fill_in field, :with => value
end

When /^I click "([^"]*)" button$/ do |label|
  click_button label
end