// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$('.close').click(function () {
		$(this).parent('div').fadeOut(1000);
	});
	
	LaPresence.Sortables();
	
})

LaPresence = {

  Sortables: function() {
    $(".sortable").sortable({
      axis: 'y',
      dropOnEmpty: false,
      cursor: 'crosshair',
      items: 'div.item',
      opacity: 0.4,
      scroll: true,
      update: function () {
        var target = $(this).attr('data-target');
        var items = $(this).sortable('serialize');
        $.ajax({
          type: 'post', 
          data: items, 
          dataType: 'script',
          url: target
        });
      }
   });
 }

};


