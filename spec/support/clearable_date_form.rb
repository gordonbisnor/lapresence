shared_examples 'clearable date form' do

  scenario 'clearable date form', js: true do
    visit index_path
    click_link t('admin.new_item')
    fill_in "Start date", with: "2001-01-01"
    fill_in "End date", with: "2010-01-01"
    page.first('.clear-date').click
    page.all('.clear-date').last.click
    page.should_not have_xpath("//input[@value='2001-01-01']")
    page.should_not have_xpath("//input[@value='2010-01-01']")
    page.find("#submit").click
    expect(page).to have_text("Item Created Successfully.")    
    page.first('.edit-button').click
    page.should_not have_xpath("//input[@value='2001-01-01']")    
    page.should_not have_xpath("//input[@value='2010-01-01']")    
  end
  

end
