shared_examples 'an event controller' do
  
	describe 'index' do
		before { item; get :index }
		it { should respond_with(:success) }
		it { should render_template(:index) } 
		specify { assigns[:items].should include(item) }
	end

	describe 'show' do
		before { get :show, id: item.id }
		it { should respond_with(:success) }
		it { should render_template(:show) } 
		specify { assigns[:item].should eql(item) }
	end

end