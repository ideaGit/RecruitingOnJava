When /^I am on the candidates information page$/ do
  visit '/admin'
end


Given /^a candidate submit his information as following:$/ do |table|
  visit '/'
  table.rows_hash.map do |key, value|
    fill_in key, :with => value
  end
  click_button "Save Changes"
end

Then /^I can see the following candidates information:$/ do |table|
  table.rows_hash.map do |key, value|
    find('.table').should have_content(value)
  end
end
