class Admin::GroupesController < Admin::AdminController
  
  # GET /groupes
  # GET /groupes.xml
  def index
    @groupes = Groupe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groupes }
    end
  end

  # GET /groupes/1
  # GET /groupes/1.xml
  def show
    @groupe = Groupe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @groupe }
    end
  end

  # GET /groupes/new
  # GET /groupes/new.xml
  def new
    @groupe = Groupe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @groupe }
    end
  end

  # GET /groupes/1/edit
  def edit
    @groupe = Groupe.find(params[:id])
  end

  # POST /groupes
  # POST /groupes.xml
  def create
    @groupe = Groupe.new(params[:groupe])

    respond_to do |format|
      if @groupe.save
        flash[:notice] = 'Groupe was successfully created.'
        format.html { redirect_to(admin_groupes_path) }
        format.xml  { render :xml => @groupe, :status => :created, :location => @groupe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @groupe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groupes/1
  # PUT /groupes/1.xml
  def update
    @groupe = Groupe.find(params[:id])

    respond_to do |format|
      if @groupe.update_attributes(params[:groupe])
        flash[:notice] = 'Groupe was successfully updated.'
        format.html { redirect_to(admin_groupes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @groupe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groupes/1
  # DELETE /groupes/1.xml
  def destroy
    @groupe = Groupe.find(params[:id])
    @groupe.destroy
    flash[:notice] = 'Groupe was deleted.'

    respond_to do |format|
      format.html { redirect_to(admin_groupes_path) }
      format.xml  { head :ok }
    end
  end
end
