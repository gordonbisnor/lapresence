class Event < ApplicationRecord
  default_scope {order("position ASC")}

  has_attached_file :picture,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :thumb => "200x1000>" }
  
  do_not_validate_attachment_file_type :picture

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
