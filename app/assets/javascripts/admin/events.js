$(document).ready(function(){
	
	$(".datepicker").datepicker({dateFormat:'yy-mm-dd'}).keyup(function(e) {
    if (e.keyCode === 8 || e.keyCode === 46) {
        $.datepicker._clearDate(this);
    }
	});
	
	/* maker dates clearable */
	$(document).on('click', '.clear-date', function () {
		$(this).prev('.datepicker').val('');
	});

	$('#content_tab, #notes_tab').hide();
	
	$('.tabs li a').click(function () {
		$('.tabs li a').removeClass('selected');
		$(this).addClass('selected');
		$('.tab').hide();
		target = $(this).attr('href')
		$(target).show();
		return false;
	});
})
