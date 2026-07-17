# frozen_string_literal: true

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
    expect(page).to have_text('Item Updated Successfully.')
  end

  scenario 'edit with failure', js: true do
    visit index_path
    page.first('.edit-button').click
    fill_in 'Title', with: 'foo'
    fill_in 'page_slug', with: ''
    find('#item-submit-button').click
    expect(page).to have_text('There was a problem updating your item')
  end

  def fill_form
    fill_in 'Title', with: 'foo'
    find('#item-submit-button').click
  end

  scenario 'admin can create a new page', js: true do
    visit index_path
    expect(page).to have_link('New Item')
    click_link 'New Item'
    expect(page).to have_css('h1', text: 'Editing Page')
    fill_in 'Title', with: 'Foo Page'
    fill_in 'page_slug', with: 'foo-page'
    find('#item-submit-button').click
    expect(page).to have_text 'Item Created Successfully'
    expect(page).to have_text 'Foo Page'
    visit '/foo-page'
  end

  scenario 'if admin tries to create a new page but fails they should see an error message', js: true do
    visit index_path
    expect(page).to have_link('New Item')
    click_link 'New Item'
    expect(page).to have_css('h1', text: 'Editing Page')
    fill_in 'Title', with: 'Foo Page'
    fill_in 'page_slug', with: ''
    find('#item-submit-button').click
    expect(page).to have_text 'There was a problem creating your item'
  end
end
