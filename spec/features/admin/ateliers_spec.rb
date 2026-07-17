require 'spec_helper'

feature 'ateliers' do
	
  before do
  	login
  	@item = FactoryBot.create(:atelier)
  end

  def index_path
    admin_ateliers_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.ateliers.header'))
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
    find('#item-submit-button').click
  end

  def it_should_be_unpublished
    within ".publish-button" do
      expect(page).to have_css("i.fa-circle")
    end
  end
  
  def it_should_be_published
    within ".publish-button" do
      expect(page).to have_css("i.fa-check-circle")
    end
  end

end
