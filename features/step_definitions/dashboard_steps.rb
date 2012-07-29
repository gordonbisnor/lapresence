# encoding: utf-8

When /^I visit the dashboard$/ do
  visit "/admin"
end

Then /^I should see the dashboard info$/ do
  page.should have_content "La Présence Administration Dashboard"
  page.should have_content "Pages"
  page.should have_content "Ateliers"
  page.should have_content "Groupes"
  page.should have_content "Images"
end