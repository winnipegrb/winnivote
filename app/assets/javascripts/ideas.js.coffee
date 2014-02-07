$ ->
	$('.edit').click ->

		$(this).parent().toggle('slow');
		$(this).parent().siblings('form').toggle('slow')

	$('.save').click ->

		list_item = $(this).closest('li.idea')
		list_item_form = list_item.find('form')
		list_item_labels = list_item.find('.labels')

		title = list_item_form.find('#idea_title').val()
		description = list_item_form.find('#idea_description').val()

		list_item_labels.find('.title').text(title)
		list_item_labels.find('.description').text(description)

		list_item_labels.toggle('slow')
		list_item_form.toggle('slow')

	$(".upvote img").click ->
		$el = $(this)
		url = "/ideas/" + $el.data("idea-id") + "/upvote"
		$.ajax(
			url: url
			type: "put"
		).done (data) ->
			$el.parent().parent().find(".votes").text data.votes