jQuery(document).ready(function(){
	
	jQuery(".datepicker").datepicker({dateFormat:'yy-mm-dd'}).keyup(function(e) {
    if(e.keyCode == 8 || e.keyCode == 46) {
        $.datepicker._clearDate(this);
    }
	});
	
	/* maker dates clearable */
	$(document).on('click', '.clear-date', function () {
		$(this).prev('.datepicker').val('');
	});

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
