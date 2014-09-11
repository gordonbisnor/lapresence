class AteliersController < ApplicationController
  before_filter :french
  
  def index
    @items = Atelier.all
  end

  def show
    @item = Atelier.find(params[:id])
  end

end
