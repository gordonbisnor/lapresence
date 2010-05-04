class PagesController < ApplicationController

  def show
    @page = Page.find_by_slug(params[:id])
  end

  def index
    render :template => "pages/index", :layout => false
  end
  
  def bio
  end
  
end