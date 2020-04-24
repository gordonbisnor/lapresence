class AteliersController < ApplicationController
  before_action :french
  
  def index
    @seo_description = "Horaire Des Ateliers par Lorraine Desmarais"
    @items = Atelier.published.all
  end

  def show
    @item = Atelier.published.find(params[:id])
    @page_title = @item.title
  end

end
