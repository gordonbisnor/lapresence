class Event < ApplicationRecord
  default_scope {order("position ASC")}

  include EventUploader::Attachment(:image) # adds an `image` virtual attribute

  def dates 
     if start_date.present? && end_date.present?
     "#{start_date} - #{end_date}"
     elsif start_date.present?
       start_date
     else
       nil
     end
   end
  
end
