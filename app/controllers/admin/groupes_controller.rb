class Admin::GroupesController < Admin::AdminController
  make_resourceful do
    actions :all

    after :create, :update, :destroy do
      expire_page "/#{@groupe.id}.html"
      expire_page "/groupes.html"
    end

    response_for :create, :update { redirect_to :action => 'index' }
  end
    
 private 

    def get_sort_items
      @items = Groupes.order("position ASC").all
    end

end
