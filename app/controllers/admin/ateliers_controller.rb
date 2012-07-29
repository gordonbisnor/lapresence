class Admin::AteliersController < Admin::AdminController
   
  # GET /ateliers
  # GET /ateliers.xml
  def index
    @ateliers = Atelier.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ateliers }
    end
  end

  # GET /ateliers/1
  # GET /ateliers/1.xml
  def show
    @atelier = Atelier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @atelier }
    end
  end

  # GET /ateliers/new
  # GET /ateliers/new.xml
  def new
    @atelier = Atelier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @atelier }
    end
  end

  # GET /ateliers/1/edit
  def edit
    @atelier = Atelier.find(params[:id])
  end

  # POST /ateliers
  # POST /ateliers.xml
  def create
    @atelier = Atelier.new(params[:atelier])

    respond_to do |format|
      if @atelier.save
        expire_page :action => :index, :controller => :ateliers
        
        flash[:notice] = 'Atelier was successfully created.'
        format.html { redirect_to(admin_ateliers_path) }
        format.xml  { render :xml => @atelier, :status => :created, :location => @atelier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @atelier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ateliers/1
  # PUT /ateliers/1.xml
  def update
    @atelier = Atelier.find(params[:id])

    respond_to do |format|
      if @atelier.update_attributes(params[:atelier])
        expire_page :action => [:index, :show], :controller => :ateliers
        flash[:notice] = 'Atelier was successfully updated.'
        format.html { redirect_to(admin_ateliers_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @atelier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ateliers/1
  # DELETE /ateliers/1.xml
  def destroy
    @atelier = Atelier.find(params[:id])
    @atelier.destroy
    flash[:notice] = 'Atelier was deleted.'

    respond_to do |format|
      format.html { redirect_to(admin_ateliers_path) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    params[:ateliers].each_with_index do |id, pos|
      Atelier.find(id).update_attribute(:position, pos+1)
    end
    render :nothing => true
  end
  
end
