class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_action :core_redirect
  
  def core_redirect
    redirect_to "http://www.lapresence.ca/formation#english" and return if request.domain =~ /coreenergeticsmontreal/ && !(request.request_uri =~ /formation/)
  end
  
  protected
  
  # Automatically respond with 404 for ActiveRecord::RecordNotFound
  def record_not_found
    render :file => File.join(Rails.root, 'public', '404.html'), :status => 404, :layout => false
  end
  
  def french
    I18n.locale = :fr
  end

  def after_sign_in_path_for(resource)
    admin_dashboard_url
  end

  def after_sign_out_path_for(resource)
    page_path('bio')
  end
    
end
