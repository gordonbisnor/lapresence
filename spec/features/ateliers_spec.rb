# -*- encoding: utf-8 -*-
require 'spec_helper'

feature 'ateliers' do

  context 'that are published' do
    
    before do 
      @atelier = FactoryBot.create(:atelier)
    end
    
    scenario 'show up on the index page' do
     	visit ateliers_path
      expect(page).to have_css('h1', text: I18n.t('ateliers.header'))
      expect(page).to have_text(@atelier.title)
      expect(page).to have_text(@atelier.location)
    end

    scenario 'show up on a detail page' do
      visit atelier_path(@atelier)
      expect(page).to have_css('h1', text: @atelier.title)
      expect(page).to have_text(@atelier.content)
    end
  end
  
  context 'that are not published' do

    before do
      @atelier = FactoryBot.create(:atelier, published: false)
    end
    
    scenario 'do not show up on the index page' do 
      visit ateliers_path
      unpublished = FactoryBot.create(:atelier, published: false)
      expect(page).to_not have_text(@atelier.title)
      expect(page).to_not have_text(@atelier.location)
    end
    
    scenario 'do not show up on a detail page' do
      visit atelier_path(@atelier)
      expect(page).to_not have_css('h1', text: @atelier.title)
    end
    
  end

end
