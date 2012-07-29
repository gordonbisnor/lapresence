When /^I view the admin images section$/ do
  visit "/admin/images"
end

Then /^I should see the admin images$/ do
  page.should have_content "Images"
end