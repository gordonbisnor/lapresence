class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :verifies_admin
  before_filter :get_klass
  
  def sort
    if params[:sort_item].present?
      items = @klass.all
      items.each do |n|
        n.position = params['sort_item'].index(n.id.to_s) + 1
        n.save
      end
      respond_to do |format|
        format.js { render :text => 'jQuery(".sortable").effect("highlight");' }
      end
    else
      get_sort_items
    end
  end
    
  private
    
    def get_klass   
      klass_name = controller_name.to_s.singularize.titlecase.gsub(' ','')
      begin
        if Kernel.const_get(klass_name)
          @klass = klass_name.constantize
        end
      rescue
        @klass = nil
      end
    end  
      
    def verifies_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "lap" && password == "7,desmarais,1."
      end if Rails.env == 'production'
    end
    
end