class Admin::PagesController < Admin::AdminController
  
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
    @page.revert_to(params[:version].to_i) if params[:version].present?
    @versions = @page.versions.reverse[0...6]
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to admin_pages_path, :notice => "Page was successfully created."
    else
      flash[:error] = "Error Updating Page"
      render :template => "admin/pages/new"
    end
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      expire(@page)
      redirect_to admin_pages_path, :notice => "Page was successfully updated."
    else
      flash[:error] = "Error Updating Page"
      render :template => "admin/pages/edit"
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    expire(@page)
    redirect_to admin_pages_path
  end
    
  private

    def expire page
      expire_page "/#{page.slug}.html"
    end
    
    
end