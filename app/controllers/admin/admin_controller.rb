# frozen_string_literal: true

module Admin
  # This is the parent that all admin section contollers should inherit from
  class AdminController < ApplicationController
    layout 'admin'
    before_action :get_klass
    before_action :get_object_params, only: %i[create update]

    before_action :authenticate_user!

    def index
      @items = @klass.sortable? ? @klass.order('position ASC').all : @klass.order('id DESC').all
    end

    def show
      @item = @klass.find(params[:id])
    end

    def new
      @item = @klass.new
      render template: 'admin/shared/form'
    end

    def edit
      @item = @klass.find(params[:id])
      render template: 'admin/shared/form'
    end

    def create
      @item = @klass.new(@object_params)

      if @item.save
        redirect_to(url_for(action: :index, controller: controller_name),
                    notice: "Item Created Successfully. #{undo_link}".html_safe)
      else
        flash.now[:error] = 'There was a problem creating your item'
        render action: 'new', template: 'admin/shared/form'
      end
    end

    def update
      @item = @klass.find(params[:id])
      respond_to do |format|
        format.html do
          if @item.update(@object_params)
            redirect_to(url_for(action: :index, controller: controller_name),
                        notice: "Item Updated Successfully. #{undo_link}".html_safe)
          else
            flash.now[:error] = 'There was a problem updating your item'
            render action: 'edit', template: 'admin/shared/form'
          end
        end
        format.js do
          if @item.update(@object_params)
            head :ok
          else
            head :bad_request
          end
        end
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
          format.js { render text: 'jQuery(".sortable").effect("highlight");' }
        end
      else
        get_sort_items
      end
    end

    private

    def undo_link
      return unless @item.respond_to?(:versions) && @item.versions.present?

      view_context.link_to('Undo', admin_revert_version_path(@item.versions.last), method: :post,
                                                                                   class: 'btn btn-xs pull-right btn-success')
    end

    def get_klass
      klass_name = controller_name.to_s.singularize.titlecase.gsub(' ', '')
      begin
        @klass = klass_name.constantize if Kernel.const_get(klass_name)
      rescue StandardError
        @klass = nil
      end
    end

    def get_object_params
      @object_params = params.require(@klass.to_s.underscore.downcase.to_sym).permit!
    end

    def get_sort_items
      @items = @klass.order('position ASC').all
    end
  end
end
