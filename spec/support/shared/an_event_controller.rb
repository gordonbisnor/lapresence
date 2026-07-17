# frozen_string_literal: true

shared_examples 'an event controller' do
  describe 'index' do
    before do
      item
      get :index
    end
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:index) }
    specify { expect(assigns[:items]).to include(item) }
  end

  describe 'show' do
    before { get :show, params: { id: item.id } }
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:show) }
    specify { expect(assigns[:item]).to eql(item) }
  end
end
