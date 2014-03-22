window.WinniVote = {}

class WinniVote.Idea
  constructor: (json) ->
    @json = ko.mapping.fromJS(json, {}, this)
  upvote: ->
    uv_url = "/ideas/#{@json.id}/upvote"
    $.ajax
      url: uv_url,
      type: "put"
      success:
        @json.votes(@json.votes +=1)

class WinniVote.IdeasViewModel
  constructor: (json_ideas) ->
      @ideas = new WinniVote.Idea(idea) for idea in json_ideas


$ ->
  $('.edit').click ->

    id = getId(this)
    $("#idea-#{id} .idea-content").fadeOut 'fast', =>
      $("#idea-#{id} .idea-form").fadeIn 'fast'

  $('.save').click ->

    id = getId(this)

    title = $("#idea-#{id} .idea-form").find('#idea_title').val()
    description = $("#idea-#{id} .idea-form").find('#idea_description').val()

    $("#idea-#{id} .idea-content").find('.title').text(title)
    $("#idea-#{id} .idea-content").find('.description').text(description)

    $("#idea-#{id} .idea-form").fadeOut 'fast', =>
      $("#idea-#{id} .idea-content").fadeIn 'fast'
  
  $('.cancel').click ->

    id = getId(this)
    
    $("#idea-#{id} .idea-form").fadeOut 'fast', =>
      $("#idea-#{id} .idea-content").fadeIn 'fast', =>

        title = $("#idea-#{id} .idea-content").find('.title').text()
        description = $("#idea-#{id} .idea-content").find('.description').text()

        $("#idea-#{id} .idea-form").find('#idea_title').val(title)
        $("#idea-#{id} .idea-form").find('#idea_description').val(description)

  getId = (button_clicked) -> $(button_clicked).closest('.idea').attr('data-target')
