# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  def navigation
    NAVIGATION.map { |item|
      content_tag :li, link_to(item[0], send("#{item[1]}_path")), :class => "#{'selected' if @page.present? && @page.slug == item[1]}" }.join('')
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
    %w(notice warning error).each do |msg|
      content = "<div class='close'><a href='#close'><img src='/images/close.png' alt=''/></a></div>" + html_escape(flash[msg.to_sym])
      messages << content_tag(:div, content, :id => "flash-#{msg}", :class => "flash") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
end
