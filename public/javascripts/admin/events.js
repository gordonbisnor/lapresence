jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
	jQuery('#content_tab, #notes_tab').hide();
	jQuery('.tabs li a').click(function(){
		jQuery('.tabs li a').removeClass('selected');
		jQuery(this).addClass('selected');
		jQuery('.tab').hide();
		target = jQuery(this).attr('href')
		jQuery(target).show();
		return false;

	})
})