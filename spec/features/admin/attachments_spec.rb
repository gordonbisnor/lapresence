# frozen_string_literal: true

require 'spec_helper'

feature 'attachments' do
  before do
    login
    @item = FactoryBot.create(:attachment)
  end

  def index_path
    admin_attachments_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.attachments.header'))
    expect(page).to have_text(@item.name)
  end

  it_behaves_like 'admin crud'

  def fill_form
    fill_in 'Name', with: 'foo bar'
    find('#item-submit-button').click
  end
end
