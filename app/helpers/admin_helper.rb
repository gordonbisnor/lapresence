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

end