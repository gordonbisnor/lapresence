class RedirectsController < ApplicationController
  
  def bio
    moved_to page_path('bio')
  end

  def approche
    moved_to page_path('approche')
  end
  
  def bibliographie
    moved_to page_path('bibliographie')
  end
  
  def ateliers
    moved_to ateliers_path
  end
  
  def groupes
    moved_to groupes_path
  end  

  def consultations
    moved_to page_path('formation')
  end
  
  def coordonnees
    moved_to page_path('coordonnees')
  end
  
  def extrait_du_livre
    moved_to page_path('extrait_du_livre')
  end
  
  def extrait_impr
    moved_to extrait_impr_path
  end
  
  private

    def moved_to location
      head :moved_permanently, :location => location
    end
  
end