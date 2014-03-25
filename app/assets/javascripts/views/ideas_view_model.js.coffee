class WinniVote.IdeasViewModel
  constructor: (jsonIdeas) ->
    @ideas = ko.observableArray(new WinniVote.IdeaViewModel(i) for i in jsonIdeas)
    @empty = ko.computed => @ideas().length == 0


class WinniVote.IdeaViewModel extends WinniVote.Idea
  
  constructor: (json) ->
    super json
    @newTitle = ko.observable()
    @newDescription = ko.observable()
    
  edit: =>
    @newTitle @title()
    @newDescription @description()
    @toggleEditing 'content', 'form'
    
  cancel: => 
    @toggleEditing 'form', 'content'

  save: ->
    @title @newTitle()
    @description @newDescription()
    @toggleEditing 'form', 'content'
    
  toggleEditing: (v1, v2)  =>
    id = "#idea-#{@id()}"
    $("#{id} .idea-#{v1}").fadeOut 'fast', -> $("#{id} .idea-#{v2}").fadeIn 'fast'
    
