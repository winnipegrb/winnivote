$ ->
	$('.edit').click ->

    id = $(this).closest('.idea').attr('data-target')
    $("#idea-#{id} .idea-content").fadeOut 'fast', =>
    	$("#idea-#{id} .idea-form").fadeIn 'fast' 

	$('.save').click ->

    id = $(this).closest('.idea').attr('data-target')

    title = $("#idea-#{id} .idea-form").find('#idea_title').val()
    description = $("#idea-#{id} .idea-form").find('#idea_description').val()

    $("#idea-#{id} .idea-content").find('.title').html(title)
    $("#idea-#{id} .idea-content").find('.description').html(description)

    $("#idea-#{id} .idea-form").fadeOut 'fast', =>
    	$("#idea-#{id} .idea-content").fadeIn 'fast'
