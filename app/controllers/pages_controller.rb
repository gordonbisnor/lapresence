class PagesController < ApplicationController
  
  def extrait_impr
    @page = Page.find_by_slug("extrait_impr")
    render :template => "pages/extrait_impr", :layout => false
  end
  
  def show
    @page = Page.find_by_slug(params[:id])
    @seo_image = @page.seo_image if @page.seo_image.present?
    @seo_description = @page.seo_description if @page.seo_description.present?
    
    record_not_found if @page.blank?
  end

  def index
    render :template => "pages/index", :layout => false
  end
    
end