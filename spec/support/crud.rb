shared_examples 'admin crud' do

  scenario 'create', js: true do
    visit index_path
    click_link t('admin.new_item')
    fill_form
    expect(page).to have_text("Item Created Successfully.")    
  end
  
  scenario 'edit' do
    visit index_path
    page.first('.edit-button').click
    fill_form
    expect(page).to have_text("Item Updated Successfully.")
  end

  scenario 'delete' do
    visit index_path
    page.first('.delete-button').click
    expect(page).to have_text("Item Deleted")
  end
  
end
