require 'spec_helper'

feature 'ateliers' do
	
  before do
  	login
  	@item = FactoryGirl.create(:atelier)
  end

  def index_path
    admin_ateliers_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.ateliers.header'))
    expect(page).to have_text(@item.title)
  end
  
  scenario 'publish and unpublish', js: true do
    visit index_path
    click_button "Click to hide from public"
    expect(page).to have_css("button.glyphicon-unchecked")
    click_button "Click to show to public"
    expect(page).to have_css("button.glyphicon-check")
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
