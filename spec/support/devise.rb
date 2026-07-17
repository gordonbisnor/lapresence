# frozen_string_literal: true

# FOR FEATURES
include Warden::Test::Helpers

# FOR CONTROLLERS
def login_admin
  allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return(true)
  allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
end

module FeatureHelpers
  def login
    @user = FactoryBot.create(:user)
    login_as @user
    @user
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
