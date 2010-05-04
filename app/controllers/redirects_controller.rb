class RedirectsController < ApplicationController
  
  def bio
    moved_to bio_path
  end
  
  private

    def moved_to location
      head :moved_permanently, :location => location
    end
  
end