When /^I view a page$/ do
  @page = FactoryGirl.create(:page)
  visit "/#{@page.slug}"
end

Then /^I should see the page content$/ do
  page.should have_content(@page.title)
  page.should have_content(@page.content)
end

#

When /^I view the admin pages section$/ do
  @page = FactoryGirl.create(:page)
  visit "/admin/pages"
end

Then /^I should see the admin pages$/ do
  page.should have_content(@page.title)
end

When /^I create a page$/ do
  @page = FactoryGirl.build_stubbed(:page)
  visit "/admin/pages/new"
  fill_in "Title", :with => @page.title
  click_button "Create Page"
end

Then /^I should see that page$/ do
  page.should have_content(@page.title)
  page.should have_content("Page was successfully created.")
end

When /^I update a page$/ do
  @page = FactoryGirl.create(:page)
  visit "/admin/pages/#{@page.id}/edit"
  fill_in "Title", :with => "New Title"
  click_button "Update Page"
end

Then /^I should see that page updated$/ do
  page.should have_content("New Title")
  page.should have_content("Page was successfully updated.")
end