class WinniVote.Idea
  constructor: (json) ->
    ko.mapping.fromJS json, {}, this

  upvote: ->
    $.ajax
      url: Routes.upvote_idea_path @id()
      type: "put",
      success: (data) => @votes data['votes']

