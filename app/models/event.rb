class Event < ApplicationRecord
  default_scope {order("position ASC")}

  include EventUploader::Attachment(:image) # adds an `image` virtual attribute

  has_attached_file :picture,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :thumb => "200x1000>" },
    :storage => :s3,
    :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
    :s3_permissions => {
      :original => "public-read"
    },
    s3_protocol: "https",
    bucket: ENV['S3_BUCKET'],
    s3_region: ENV['S3_REGION'],
    path: "/:attachment/:id/:style/:filename",
    url: ":s3_domain_url"

  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

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
