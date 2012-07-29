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
        expire_index
        format.html { redirect_to(admin_ateliers_path, :notice => 'Atelier was successfully created.') }
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
        expire_index
        expire(@atelier)
        format.html { redirect_to(admin_ateliers_path, :notice => 'Atelier was successfully updated.') }
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
    expire_index
    expire(@atelier)

    respond_to do |format|
      format.html { redirect_to(admin_ateliers_path, :notice => 'Atelier was deleted.') }
      format.xml  { head :ok }
    end
  end
    
  private

    def expire_index
      expire_page "/ateliers.html"
    end
  
    def expire atelier
      expire_page "/ateliers/#{atelier.id}.html"
    end
  
    def get_sort_items
      @items = Atelier.order("position ASC").all
    end
  
end
