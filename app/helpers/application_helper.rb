# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  ALERT_TYPES_MAP = {
    notice: :success,
    alert: :danger,
    error: :danger,
    info: :info,
    warning: :warning
  }

  def bootstrap_flash
    safe_join(flash.each_with_object([]) do |(type, message), messages|
                next if message.blank? || !message.respond_to?(:to_str)
                type = ALERT_TYPES_MAP.fetch(type.to_sym, type)
                messages << flash_container(type, message)
              end, "\n").presence
  end

  def flash_container(type, message)
    content_tag :div, class: "alert alert-#{type} alert-dismissable" do
      button_tag type: "button", class: "close", data: { dismiss: "alert" } do
        "&times;".html_safe
      end.safe_concat(message)
    end
  end
end

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
    %w(notice warning error).each do |msg|
      content = "<div class='close'><a href='#close'><img src='/assets/close.png' alt=''/></a></div>" + html_escape(flash[msg.to_sym])
      messages << content_tag(:div, raw(content), id: "flash-#{msg}", class: "flash") unless flash[msg.to_sym].blank?
    end
    messages.join
  end
  
end
