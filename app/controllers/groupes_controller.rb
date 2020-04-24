class GroupesController < ApplicationController
  before_action :french
  
  def index
    @items = Groupe.all
    @seo_title = "Groupes"
  end

  def show
    @item = Groupe.find(params[:id])
    @seo_title = @item.title
  end

end
