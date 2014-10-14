#
# Provides undo
#
class Admin::VersionsController < Admin::AdminController
  
  def revert
    @version = PaperTrail::Version.find(params[:id])
    
    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end
    
    link_name = params[:redo] == "true" ? t('undo') : t('redo')
    link = view_context.link_to(link_name, admin_revert_version_path(@version.next, redo: !params[:redo]),method: :post, class: "btn btn-xs pull-right btn-success")
    redirect_to :back, notice: "Undid #{@version.event}. #{link}".html_safe
  end
  
end
