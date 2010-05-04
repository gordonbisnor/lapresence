class PagesController < ApplicationController

  def show
    @page = Page.find_by_slug(params[:id])
    record_not_found if @page.blank?
  end

  def index
    render :template => "pages/index", :layout => false
  end
  
  def bio
  end
  
end