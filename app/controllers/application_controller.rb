class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  protect_from_forgery prepend: true, with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  before_action :core_redirect
  before_action :seo
  
  def seo
    @seo_image = "https://lapresence.ca/system/pictures/3/thumb/guide.jpg?1273796283"
    @seo_description = "Lorraine Desmarais, Thérapeute, animatrice, Healer, connaissance de soi, amour de soi, guérison spirituelle, làcher prise."
    @seo_title = "La Présence" 
    @seo_url = request.original_url
    @seo_headline = "La guérison ne peut survenir que dans la présence"
  end
  
  def core_redirect
    redirect_to "https://www.lapresence.ca/formation#english" and return if request.domain =~ /coreenergeticsmontreal/ && !(request.request_uri =~ /formation/)
  end
  
  protected
  
  # Automatically respond with 404 for ActiveRecord::RecordNotFound
  def record_not_found
    render file: File.join(Rails.root, 'public', '404.html'), status: 404, layout: false
  end
  
  def french
    I18n.locale = :fr
  end
  
  def set_meta_locale
    @meta_locale = "fr_CA"
  end

  def after_sign_in_path_for(resource)
    admin_dashboard_url
  end

  def after_sign_out_path_for(resource)
    page_path('bio')
  end
    
end
