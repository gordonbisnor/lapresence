class GroupesController < ApplicationController
  before_action :french
  
  def index
    @items = Groupe.all
  end

  def show
    @item = Groupe.find(params[:id])
  end

end
