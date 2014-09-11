class Admin::AttachmentsController <  Admin::AdminController
  make_resourceful do
    actions :all
    response_for :create, :update do
      redirect_to :action => 'index'
    end
  end
end
