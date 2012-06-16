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

Then /^I should see the following in database:$/ do |table|
  queries = table.rows_hash.map do |key, value|
    "#{key} = '#{value}'"
  end
  where = queries.join ' and '
  should have_user_like where
end

Then /^I should see the error messages "([^"]*)"$/ do |message|
  find('.alert-error').should have_content(message)
end