# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  def dates groupe
     if groupe.start_date.present? && groupe.end_date.present?
     "#{l(groupe.start_date, :format => :long_ordinal)} - #{l(groupe.end_date, :format => :long_ordinal)}"
     elsif groupe.start_date.present?
       groupe.start_date
     else
       nil
     end
   end
    
  def navigation
    items = []
    NAVIGATION.map { |item|
      begin
        items << content_tag(:li, link_to(item[0], send("#{item[1]}_path")), class: "#{'selected' if @page.present? && @page.slug == item[1]}")
      rescue
        items << content_tag(:li, link_to(item[0], item[1], target: "_blank"))
      end
    }
    return items.join(' ')
  end
  
  # Sets the page title and outputs title if container is passed in.
  # eg. <%= title('Hello World', :h2) %> will return the following:
  # <h2>Hello World</h2> as well as setting the page title.
  def title(str, container = nil)
    @page_title = str
    content_tag(container, str) if container
  end
  
  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    %w(notice alert warning error).each do |msg|
      content = "<div class='close'><a href='#close'><img src='/assets/close.png' alt=''/></a></div>" + html_escape(flash[msg.to_sym])
      messages << content_tag(:div, raw(content), id: "flash-#{msg}", class: "flash") unless flash[msg.to_sym].blank?
    end
    messages.join
  end
  
end
