class Image < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :thumb => "100x100#" }

  def url
    APP_CONFIG[:site_url] + attachment.url.split("?")[0]
  end
  
end
