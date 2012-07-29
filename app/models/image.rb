class Image < ActiveRecord::Base
  has_attached_file :attachment,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :thumb => "100x100#" }

  def url
    APP_CONFIG[:site_url] + attachment.url.split("?")[0]
  end
  
end
