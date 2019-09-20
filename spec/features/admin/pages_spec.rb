require 'spec_helper'

feature 'ateliers' do
  
  before do
    login
    @item = FactoryGirl.create(:page)
  end

  def index_path
    admin_pages_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.pages.header'))
    expect(page).to have_text(@item.title)
  end

  scenario 'edit' do
    visit index_path
    page.first('.edit-button').click
    fill_form
    expect(page).to have_text("Item Updated Successfully.")
  end

  def fill_form
    fill_in "Title", with: "foo"
    fill_in "Content", with: "qux"
    page.find("#submit").click
  end

  scenario "admin can create a new page" do
    visit index_path
    expect(page).to have_link("New Item")
    click_link "New Item"
    expect(page).to have_css(:h1, text: "Editing Page")
    fill_in "Title", with: "Foo Page"
    content = Faker::Lorem.paragraph(sentence_count: 7)
    fill_in "Content", with: content
    fill_in "Slug", with: "foo-page"
    click_button "Create Page"
    expect(page).to have_text "Item Created Successfully"
    expect(page).to have_text "Foo Page"
    visit "/foo-page"
    expect(page).to have_text(content)
  end

end
