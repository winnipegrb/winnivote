class WinniVote.IdeaViewModel extends WinniVote.Idea
  
  constructor: (json) ->
    super json
    @projectName = ko.computed => @project?.name()
    @newTitle = ko.observable()
    @newDescription = ko.observable()
    @toggler = new WinniVote.IdeaToggle @id() 
    
  edit: =>
    @newTitle @title()
    @newDescription @description()
    @toggler.toggle()
    
  cancel: =>
    @toggler.toggle()

  save: =>
    @title @newTitle()
    @description @newDescription()
    @update()
    @toggler.toggle()

class WinniVote.IdeaToggle

  constructor: (id) ->
    @idea_id  = "#idea-#{id}"
    @source = -> $("#{@idea_id} .idea-content")
    @target = -> $("#{@idea_id} .idea-form")

  toggle: () =>
    [source, target] = [@source(), @target()]
    source.fadeOut 'fast', -> target.fadeIn 'fast'
    [@source, @target] = [@target, @source]
