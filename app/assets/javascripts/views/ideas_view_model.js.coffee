class WinniVote.IdeasViewModel
  constructor: (jsonIdeas) ->
    @ideas = ko.observableArray(new WinniVote.Idea(i) for i in jsonIdeas)
    @empty = ko.computed => @ideas().length == 0

