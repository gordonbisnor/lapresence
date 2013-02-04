When /^I view the ateliers page$/ do
  @atelier = FactoryGirl.create(:atelier)
  visit "/ateliers"
end

When /^I view one atelier$/ do
  visit "/ateliers/#{@atelier.id}"
end

Then /^I should see the ateliers$/ do
  page.should have_content(@atelier.title)
  page.should have_content(@atelier.location)
end

Then /^I should see the atelier$/ do
  page.should have_content(@atelier.title)
  page.should have_content(@atelier.content)
  page.should have_content(@atelier.schedule)
  page.should have_content(@atelier.location)
  page.should have_content(@atelier.cost)
  page.should have_content(@atelier.available_spots)
  page.should have_content(@atelier.notes)
end

When /^I view the admin ateliers section$/ do
  @atelier = FactoryGirl.create(:atelier)
  visit "/admin/ateliers"
end

Then /^I should see the admin ateliers$/ do
  page.should have_content(@atelier.title)
end

When /^I create an atelier$/ do
  @atelier = FactoryGirl.build_stubbed(:atelier)
  visit "/admin/ateliers/new"
  fill_in "Title", :with => @atelier.title
  fill_in "Location", :with => @atelier.location
  fill_in "Cost", :with => @atelier.cost
  fill_in "Available spots", :with => @atelier.available_spots
  fill_in "Schedule", :with => @atelier.schedule  
  click_button "Create Atelier"
end

Then /^I should see that atelier$/ do
  page.should have_content(@atelier.title)
end

When /^I update an atelier$/ do
  @atelier = FactoryGirl.create(:atelier)
  visit "/admin/ateliers/#{@atelier.id}/edit"
  fill_in "Title", :with => "New Title"
  click_button "Update Atelier"
end

Then /^I should see that atelier updated$/ do
  page.should have_content("New Title")
end

When /^I delete an atelier$/ do
  @atelier = FactoryGirl.create(:atelier)
  visit "/admin/ateliers"
  click_link "Delete"
end

Then /^that atelier should be gone$/ do
  page.should_not have_content(@atelier.title)
end
