class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :verifies_admin
  uses_tiny_mce :only => [:new,:edit], :options => TINY_MCE_OPTIONS
  
  private
    
    def verifies_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "lap" && password == "7,desmarais,1."
      end
    end
    
end