class Attachment < ApplicationRecord
  has_attached_file :attachment,
    :styles => { :thumb => "100x100#" },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
    :s3_permissions => {
      :original => "public-read"
    },
    s3_protocol: "https",
    bucket: ENV['S3_BUCKET'],
    s3_region: "ca-central-1",
    path: "/:attachment/:id/:style/:filename"#,

  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

  do_not_validate_attachment_file_type :attachment

  def url
    #APP_CONFIG[:site_url] + attachment.url.split("?")[0]
    attachment.url.split("?")[0]
  end

  before_post_process :image?
	def image?
  	!(attachment_content_type =~ /^image.*/).nil?
	end
  
  def content_type
    case attachment_content_type
      when /^image.*/
        "Image"
      when "application/pdf"
        "PDF"
      else
        "Attachment"
    end
  end

end
