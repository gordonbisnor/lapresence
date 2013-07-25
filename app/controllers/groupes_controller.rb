class GroupesController < ApplicationController
  before_filter :french
  
  # GET /groupes
  def index
    @groupes = Groupe.all
  end

  # GET /groupes/1
  def show
    @groupe = Groupe.find(params[:id])
  end

end
