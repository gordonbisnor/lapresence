class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :verifies_admin
  before_filter :get_klass
  before_filter :get_object_params, only: [:create,:update]
  
  def index
    @items = @klass.sortable? ? @klass.order("position ASC").all : @klass.order("id DESC").all
  end

  def show
    @item = @klass.find(params[:id])
  end

  def new
    @item = @klass.new
    render template: "admin/shared/form"
  end

  def edit
    @item = @klass.find(params[:id])
    render template: "admin/shared/form"
  end

  def create
    @item = @klass.new(@object_params)

    if @item.save
      redirect_to(url_for(action: :index, controller: controller_name), notice: "Item Created Successfully. #{undo_link}".html_safe) 
    else
      render action: "new" 
    end
  end

  def update
    @item = @klass.find(params[:id])

    if @item.update_attributes(@object_params)
      redirect_to(url_for(action: :index, controller: controller_name), notice: "Item Updated Successfully. #{undo_link}".html_safe) 
    else
      render action: "edit" 
    end
  end

  def destroy
    @item = @klass.find(params[:id])
    @item.destroy
    redirect_to(url_for(action: :index, controller: controller_name), notice: "Item Deleted. #{undo_link}".html_safe)
  end

  def sort
    if params[:sort_item].present?
      items = @klass.all
      items.each do |n|
        n.position = params['sort_item'].index(n.id.to_s) + 1
        n.save
      end
      respond_to do |format|
        format.js { render :text => 'jQuery(".sortable").effect("highlight");' }
      end
    else
      get_sort_items
    end
  end
    
  private
    
    def undo_link
      view_context.link_to("Undo", admin_revert_version_path(@item.versions.scoped.last), method: :post, class: "btn btn-mini pull-right btn-success")
    end
    
    def get_klass   
      klass_name = controller_name.to_s.singularize.titlecase.gsub(' ','')
      begin
        if Kernel.const_get(klass_name)
          @klass = klass_name.constantize
        end
      rescue
        @klass = nil
      end
    end
  
    def verifies_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == "lap" && password == "7,desmarais,1."
      end if Rails.env == 'production'
    end
    
    def get_object_params
      @object_params = params[@klass.to_s.underscore.downcase.to_sym]
    end

    def get_sort_items
      @items = @klass.order("position ASC").all
    end

end
