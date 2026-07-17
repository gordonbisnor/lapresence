# frozen_string_literal: true

# These are workshops
#
class Atelier < Event
  def self.published
    where(published: true)
  end
end
