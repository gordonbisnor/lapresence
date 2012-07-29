When /^I view the groupes page$/ do
  @groupe = FactoryGirl.create(:groupe)
  visit "/groupes"
end

When /^I view one groupe$/ do
  visit "/groupes/#{@groupe.id}"
end

Then /^I should see the groupes$/ do
  page.should have_content(@groupe.title)
  page.should have_content(@groupe.location)
end

Then /^I should see the groupe$/ do
  page.should have_content(@groupe.title)
  page.should have_content(@groupe.content)
  page.should have_content(@groupe.schedule)
  page.should have_content(@groupe.location)
  page.should have_content(@groupe.cost)
  page.should have_content(@groupe.available_spots)
  page.should have_content(@groupe.notes)
end

When /^I view the admin groupes section$/ do
  @groupe = FactoryGirl.create(:groupe)
  visit "/admin/groupes"
end

Then /^I should see the admin groupes$/ do
  page.should have_content(@groupe.title)
end

When /^I create a groupe$/ do
  @groupe = FactoryGirl.build_stubbed(:groupe)
  visit "/admin/groupes/new"
  fill_in "Title", :with => @groupe.title
  fill_in "Location", :with => @groupe.location
  fill_in "Cost", :with => @groupe.cost
  fill_in "Available spots", :with => @groupe.available_spots
  fill_in "Schedule", :with => @groupe.schedule  
  click_button "Create Groupe"
end

Then /^I should see that groupe$/ do
  page.should have_content(@groupe.title)
  page.should have_content("Groupe was successfully created.")
end

When /^I update a groupe$/ do
  @groupe = FactoryGirl.create(:groupe)
  visit "/admin/groupes/#{@groupe.id}/edit"
  fill_in "Title", :with => "New Title"
  click_button "Update Groupe"
end

Then /^I should see that groupe updated$/ do
  page.should have_content("New Title")
  page.should have_content("Groupe was successfully updated.")
end

When /^I delete a groupe$/ do
  @groupe = FactoryGirl.create(:groupe)
  visit "/admin/groupes"
  click_link "Delete"
end

Then /^that groupe should be gone$/ do
  page.should have_content("Groupe was deleted.")
  page.should_not have_content(@groupe.title)
end