Given /^I am on the submit page$/ do
  visit '/'
end

When /^I submit my information$/ do
  fill_in 'name', :with => 'wangyan'
  fill_in 'university', :with => 'xjtu'

  click_button 'Save Changes'
end

Then /^I should see success message$/ do
  page.should have_content('you have submitted your information successfully')
end
