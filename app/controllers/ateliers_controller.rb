class AteliersController < ApplicationController
  before_filter :french
  
  # GET /ateliers
  def index
    @ateliers = Atelier.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /ateliers/1
  def show
    @atelier = Atelier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
