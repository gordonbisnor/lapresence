class Atelier < Event
  
  def self.published
    where(published: true)
  end

end