// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){

  tinymce.init({
    selector: '.tinymce',
    plugins: 'a11ychecker advcode casechange formatpainter linkchecker lists checklist media mediaembed pageembed permanentpen powerpaste tinycomments tinydrive tinymcespellchecker',
    toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter  pageembed permanentpen',
    toolbar_drawer: 'floating',
    tinycomments_mode: 'embedded',
    tinycomments_author: 'Author name'
 });

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


