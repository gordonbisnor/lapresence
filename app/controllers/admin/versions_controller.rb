# frozen_string_literal: true

#
# Provides undo
#
module Admin
  # Manages versioning
  class VersionsController < Admin::AdminController
    def revert
      @version = PaperTrail::Version.find(params[:id])

      if @version.reify
        @version.reify.save!
      else
        @version.item.destroy
      end

      flash[:notice] = "Undid #{@version.event}. #{link}".html_safe
      redirect_back(fallback_location: admin_dashboard_path)
    end

    def link_name
      params[:redo] == 'true' ? t('undo') : t('redo')
    end
    private :link_name

    def link
      view_context.link_to(
        link_name, admin_revert_version_path(
                     @version.next,
                     redo: !params[:redo]
                   ),
        method: :post,
        class: 'btn btn-xs pull-right btn-success'
      )
    end
    private :link
  end
end
