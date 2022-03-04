require 'spec_helper'

feature 'pages' do
  
  before do
    login
    @item = FactoryBot.create(:page)
  end

  def index_path
    admin_pages_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.pages.header'))
    expect(page).to have_text(@item.title)
  end

  scenario 'edit', js: true do
    visit index_path
    page.first('.edit-button').click
    fill_form
    expect(page).to have_text("Item Updated Successfully.")
  end

  def fill_form
    fill_in "Title", with: "foo"
    find('#item-submit-button').click
  end

  scenario "admin can create a new page", js: true do
    visit index_path
    expect(page).to have_link("New Item")
    click_link "New Item"
    expect(page).to have_css("h1", text: "Editing Page")
    fill_in "Title", with: "Foo Page"
    fill_in "Slug", with: "foo-page"
    find('#item-submit-button').click
    expect(page).to have_text "Item Created Successfully"
    expect(page).to have_text "Foo Page"
    visit "/foo-page"
  end

end
