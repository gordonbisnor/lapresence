require 'spec_helper'

describe PagesController do
	before { @page = FactoryGirl.create(:page, slug: 'extrait_impr') }
	
	describe 'extrait_impr' do
		before { get :extrait_impr }
		it { should respond_with(:success) }
		it { should render_template(:extrait_impr) }
		specify { assigns[:page].should eql(@page) }
	end
	
	describe 'show' do
		before { get :show, id: @page.slug }
		it { should respond_with(:success) }
		it { should render_template(:show) }
		specify { assigns[:page].should eql(@page) }
	end
	
	describe 'index' do
		before { get :index }
		it { should respond_with(:success) }
		it { should render_template(:index) }
	end

end



  
