class Admin::ImagesController <  Admin::AdminController
  make_resourceful do
    actions :all
    response_for :create, :update { redirect_to :action => 'index' }
  end
end
