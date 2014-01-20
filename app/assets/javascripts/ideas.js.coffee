$ ->
	$('.edit').click ->
		
		$(this).parent().toggle('slow');
		$(this).parent().siblings('form').toggle('slow')
