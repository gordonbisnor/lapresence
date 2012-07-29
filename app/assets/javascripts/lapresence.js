jQuery(document).ready(function(){
	jQuery('.scrollto a').click(function(){
		target = jQuery(this).attr('href');
		$.scrollTo(target, 200, {offset:-40})
		return false;
	})
})

