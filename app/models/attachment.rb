class Attachment < ApplicationRecord
  include ShrineUploader::Attachment(:shrine) # adds an `image` virtual attribute 

  has_attached_file :attachment,
    :styles => { :thumb => "100x100#" },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
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

  do_not_validate_attachment_file_type :attachment

  def url
    attachment.url.split("?")[0]
  end

  before_post_process :image?
	def image?
  	!(attachment_content_type =~ /^image.*/).nil?
	end
  
  def content_type
    if shrine_url.present?
      content_type_case(shrine.mime_type)
    else
      content_type_case(attachment_content_type)
    end
  end

  def content_type_case(val)
    case val
    when /^image.*/
      "Image"
    when "application/pdf"
      "PDF"
    when /^audio.*/
      "Audio"
    when /^video.*/
      "Video"
    else
      "Attachment"
    end
  end

  def image?
    content_type == 'Image'
  end

end
