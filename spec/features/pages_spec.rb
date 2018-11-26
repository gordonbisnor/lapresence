# -*- encoding: utf-8 -*-
require 'spec_helper'

feature 'pages' do

  scenario 'index' do
   	visit "/"
    expect(page).to have_css('body#home')
  end


  scenario 'show' do
  	p = FactoryGirl.create(:page)
   	visit page_path(p.slug)
    expect(page).to have_text(p.content)
  end

end
