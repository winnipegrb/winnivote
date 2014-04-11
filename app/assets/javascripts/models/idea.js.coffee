class WinniVote.Idea
  constructor: (json) ->
    ko.mapping.fromJS json, {}, this

  update: ->
    $.ajax
      url: Routes.idea_path @id()
      type: "put"
      data: {idea: {title: @title(), description: @description(), project_id: @project_id()}}
    
  upvote: ->
    $.ajax
      url: Routes.upvote_idea_path @id()
      type: "put"
      success: (data) => @votes data.votes
      error: (jqXHR, textStatus, errorThrown) =>
        window.location = Routes.new_user_session_path() if jqXHR.status == 401

