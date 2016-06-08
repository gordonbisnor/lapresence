require 'spec_helper'

feature 'dashboard' do
	
  before do
  	login
  end

  def index_path
    admin_dashboard_path
  end

  scenario 'index' do
    visit index_path
    expect(page).to have_css('h1', text: t('admin.dashboard.header'))
  end
  
end
