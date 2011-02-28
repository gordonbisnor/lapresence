# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :core_redirect
  
  def core_redirect
    redirect_to "http://www.lapresence.ca/formation#english" and return if request.domain =~ /coreenergeticsmontreal/ && !(request.request_uri =~ /formation/)
  end
  
  protected
  
  # Automatically respond with 404 for ActiveRecord::RecordNotFound
  def record_not_found
    render :file => File.join(RAILS_ROOT, 'public', '404.html'), :status => 404
  end
  
  def french
    I18n.locale = :fr
  end
  
end
