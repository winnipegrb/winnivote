class WinniVote.IdeaFactory

  @getJSONIdeas: (noOfIdeas) =>
    ideas  = []
    ideas.push @getJSONIdea(i) for i in [1 .. noOfIdeas]

    ideas

  @getJSONIdea: (ideaId) =>
    randVotes     = Math.floor(Math.random() * 9999) + 1
    randProjectId = Math.floor(Math.random() * 9999) + 1

    idea =
      id          : ideaId
      title       : "Test Idea #{ideaId}"
      description : "An idea for project #{randProjectId} with #{randVotes} votes!"
      votes       : randVotes
      project_id  : randProjectId