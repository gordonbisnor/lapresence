require 'spec_helper'

feature 'groupes' do
  
  before do
    login
    @item = FactoryGirl.create(:groupe)
  end

  def index_path
    admin_groupes_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.groupes.header'))
    expect(page).to have_text(@item.title)
  end
  
  it_behaves_like 'admin crud'
  it_behaves_like 'clearable date form'
  
  def fill_form
    fill_in "Title", with: "foo"
    fill_in "Start date", with: "2001-01-01"
    fill_in "End date", with: "2001-01-02"
    fill_in "Location", with: "bar"
    fill_in "Cost", with: "baz"
    fill_in "Available spots", with: 8
    fill_in "Schedule", with: "foo"
    page.find("#submit").click
  end

end
