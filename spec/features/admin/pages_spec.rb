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

end
