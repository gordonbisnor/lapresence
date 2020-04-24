# -*- encoding: utf-8 -*-
require 'spec_helper'

feature 'groupes' do
  
  before do 
    @groupe = FactoryBot.create(:groupe)
  end

  scenario 'index' do
   	visit groupes_path
    expect(page).to have_css('h1', text: I18n.t('groups.header'))
    expect(page).to have_text(@groupe.title)
    expect(page).to have_text(@groupe.location)
  end

  scenario 'show' do
    visit groupe_path(@groupe)
    expect(page).to have_css('h1', text: @groupe.title)
    expect(page).to have_text(@groupe.content)
  end

end
