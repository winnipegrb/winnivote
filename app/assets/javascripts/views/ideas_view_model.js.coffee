class WinniVote.IdeasViewModel

  constructor: (ideas) ->
    @ideas = ko.observableArray(new WinniVote.IdeaViewModel(i) for i in ideas)
    @empty = ko.computed => @ideas().length == 0
    
