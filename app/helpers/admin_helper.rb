module AdminHelper
	
	def active_on(c)
		'active' if controller_name == c
	end
	
	def edit_button
		content_tag(:span, nil, class: 'glyphicon glyphicon-edit admin-button', title: 'Edit')
	end

	def delete_button
		content_tag(:span, nil, class: 'glyphicon glyphicon-remove-circle text-danger admin-button', title: 'Delete')
	end

	def link_button
		content_tag(:span, nil, class: 'glyphicon glyphicon-link text-success admin-button', title: 'Link')
	end

	def content_typer(c)
		case c
		when "Image"
			%{<i class="far fa-image"></i> Image}.html_safe
		when "Audio"
			%{<i class="fas fa-volume-up"></i> Audio}.html_safe
		when "Video"
			%{<i class="fas fa-video"></i> Video}.html_safe
		when "PDF"
			%{<i class="far fa-file-pdf"></i> PDF}.html_safe
		else
			"Attachment"
		end
	end

end