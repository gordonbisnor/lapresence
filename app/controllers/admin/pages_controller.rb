class Admin::PagesController < ApplicationController
  layout 'admin'
  before_filter :verifies_admin
  uses_tiny_mce :only => [:new,:edit], :options => TINY_MCE_OPTIONS
  
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
    @page.revert_to(params[:version].to_i) if params[:version].present?
    @versions = @page.versions.reverse[1...6]
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page Created"
      redirect_to admin_pages_path
    else
      flash[:error] = "Error Updating Page"
      render :template => "admin/pages/new"
    end
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page Updated"
      redirect_to admin_pages_path
    else
      flash[:error] = "Error Updating Page"
      render :template => "admin/pages/edit"
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path
  end
  
  private
    
    def verifies_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "lap" && password == "7,desmarais,1."
      end
    end
  
end