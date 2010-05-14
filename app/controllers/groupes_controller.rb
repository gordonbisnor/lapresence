class GroupesController < ApplicationController
  before_filter :french

  # GET /groupes
  def index
    @groupes = Groupe.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /groupes/1
  # GET /groupes/1.xml
  def show
    @groupe = Groupe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
