# frozen_string_literal: true

require 'spec_helper'

describe GroupesController do
  let(:item) { FactoryBot.create(:groupe) }
  it_behaves_like 'an event controller'
end
