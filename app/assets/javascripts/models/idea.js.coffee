class WinniVote.Idea
  constructor: (json) ->
    ko.mapping.fromJS json, {}, this

  update: ->
    $.ajax
      url: Routes.idea_path @id()
      type: "put"
      data: {idea: {title: @title(), description: @description()}}
    
  upvote: ->
    $.ajax
      url: Routes.upvote_idea_path @id()
      type: "put",
      success: (data) => @votes data['votes']

