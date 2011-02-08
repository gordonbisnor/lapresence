class RedirectsController < ApplicationController
  
  def bio
    moved_to bio_path
  end

  def approche
    moved_to approche_path
  end
  
  def bibliographie
    moved_to bibliographie_path
  end
  
  def ateliers
    moved_to ateliers_path
  end
  
  def groupes
    moved_to groupes_path
  end  

  def consultations
    moved_to formation_path
  end
  
  def coordonnees
    moved_to coordonnees_path
  end
  
  def extrait_du_livre
    moved_to extrait_du_livre_path
  end
  
  def extrait_impr
    moved_to extrait_impr_path
  end
  
  private

    def moved_to location
      head :moved_permanently, :location => location
    end
  
end