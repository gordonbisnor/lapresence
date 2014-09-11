require 'spec_helper'

describe GroupesController do
	let(:item) { FactoryGirl.create(:groupe) }
  it_behaves_like 'an event controller'	
end