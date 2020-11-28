class Event < ApplicationRecord
  default_scope {order("position ASC")}

  include EventUploader::Attachment(:image) # adds an `image` virtual attribute

  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

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
