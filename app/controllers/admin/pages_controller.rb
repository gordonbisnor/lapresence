class Admin::PagesController < Admin::AdminController
  make_resourceful do
    actions :index, :show, :new, :create, :update, :destroy
    after :create, :update, :destroy { expire_page "/#{@page.slug}.html" }
    response_for :create, :update { redirect_to :action => 'index' }
  end

  def edit
    @page = Page.find(params[:id])
    @page.revert_to(params[:version].to_i) if params[:version].present?
    @versions = @page.versions.reverse[0...6]
  end
      
end
