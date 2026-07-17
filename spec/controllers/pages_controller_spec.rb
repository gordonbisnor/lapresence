# frozen_string_literal: true

require 'spec_helper'

describe PagesController do
  before { @page = FactoryBot.create(:page, slug: 'extrait_impr') }

  describe 'extrait_impr' do
    before { get :extrait_impr }
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:extrait_impr) }
    specify { expect(assigns[:page]).to eql(@page) }
  end

  describe 'show' do
    before { get :show, params: { id: @page.slug } }
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:show) }
    specify { expect(assigns[:page]).to eql(@page) }
  end

  describe 'index' do
    before { get :index }
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:index) }
  end
end
