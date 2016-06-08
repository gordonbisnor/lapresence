# -*- encoding: utf-8 -*-
require 'spec_helper'

feature 'ateliers' do
  
  before do 
    @atelier = FactoryGirl.create(:atelier)
  end

  scenario 'index' do
   	visit ateliers_path
    expect(page).to have_css('h1', I18n.t('ateliers.header'))
    expect(page).to have_text(@atelier.title)
    expect(page).to have_text(@atelier.location)
  end

  scenario 'show' do
    visit atelier_path(@atelier)
    expect(page).to have_css('h1', @atelier.title)
    expect(page).to have_text(@atelier.content)
  end

end
