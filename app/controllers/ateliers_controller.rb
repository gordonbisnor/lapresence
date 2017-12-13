class AteliersController < ApplicationController
  before_action :french
  
  def index
    @items = Atelier.published.all
  end

  def show
    @item = Atelier.published.find(params[:id])
  end

end
