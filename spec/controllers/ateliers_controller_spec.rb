require 'spec_helper'

describe AteliersController do
	let(:item) { FactoryGirl.create(:atelier) }
  it_behaves_like 'an event controller'	
end