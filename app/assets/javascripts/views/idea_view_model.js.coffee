class WinniVote.IdeaViewModel extends WinniVote.Idea
  
  constructor: (json) ->
    super json
    @projectName = ko.computed => @project?.name()
    @newTitle = ko.observable()
    @newDescription = ko.observable()
    
  edit: =>
    @newTitle @title()
    @newDescription @description()
    @toggleEditing 'content', 'form'
    
  cancel: => 
    @toggleEditing 'form', 'content'

  save: =>
    @title @newTitle()
    @description @newDescription()
    @update()
    @toggleEditing 'form', 'content'
    
  # Switches between idea content div and idea edit div
  toggleEditing: (fromName, toName)  =>
    id = "#idea-#{@id()}"
    $("#{id} .idea-#{fromName}").fadeOut 'fast', -> $("#{id} .idea-#{toName}").fadeIn 'fast'