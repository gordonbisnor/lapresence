class Attachment < ActiveRecord::Base
  has_attached_file :attachment,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :thumb => "100x100#" }

  def url
    APP_CONFIG[:site_url] + attachment.url.split("?")[0]
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
