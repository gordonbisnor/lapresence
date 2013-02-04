class Admin::AteliersController < Admin::AdminController
  make_resourceful do
    actions :all

    after :create, :update, :destroy do
      expire_page "/ateliers/#{@atelier.id}.html"
      expire_page "/ateliers.html"
    end

    response_for :create, :update do
      redirect_to :action => 'index'
    end
  end
    
  private
    
    def get_sort_items
      @items = Atelier.order("position ASC").all
    end
  
end
