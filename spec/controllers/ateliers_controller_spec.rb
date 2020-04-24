require 'spec_helper'

describe AteliersController do
	let(:item) { FactoryBot.create(:atelier) }
  it_behaves_like 'an event controller'	
end