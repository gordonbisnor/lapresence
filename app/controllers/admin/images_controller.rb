class Admin::ImagesController <  Admin::AdminController
  
  # GET /images
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /images/1
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /images/new
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  def create
    @image = Image.new(params[:image])

    respond_to do |format|
      if @image.save
        flash[:notice] = 'Image was successfully created.'
        format.html { redirect_to(admin_images_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /images/1
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(admin_images_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /images/1
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(admin_images_url) }
    end
  end
end
