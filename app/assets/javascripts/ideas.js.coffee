$ ->
	$('.edit').click ->

    id = $(this).attr('data-target')
    $("#idea-#{id} .idea-content").toggle('slow')
    $("#idea-#{id} .idea-form").toggle('slow')

	$('.save').click ->

    id = $(this).attr('data-target')

    $("#idea-#{id} .idea-content").toggle('slow')
    $("#idea-#{id} .idea-form").toggle('slow')


		#list_item_form.fadeOut "fast", =>
		#list_item_labels.fadeIn "fast"
