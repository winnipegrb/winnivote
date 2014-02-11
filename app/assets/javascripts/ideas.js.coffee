$ ->
	$('.edit').click ->

    id = $(this).attr('data-target')
    $("#idea-#{id} .idea-content").toggle('slow')
    $("#idea-#{id} .idea-form").toggle('slow')

	$('.save').click ->
		list_item = $(this).closest('li.idea')
		list_item_form = list_item.find('form')
		list_item_labels = list_item.find('.labels')

		title = list_item_form.find('#idea_title').val()
		description = list_item_form.find('#idea_description').val()

		list_item_labels.find('.title').text(title)
		list_item_labels.find('.description').text(description)

		list_item_form.fadeOut "fast", =>
			list_item_labels.fadeIn "fast"
