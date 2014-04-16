class WinniVote.IdeaFactory

  @attributesArray: (noOfIdeas) =>
    @attributes(i) for i in [1 .. noOfIdeas]

  @attributes: (ideaId = 1) =>
    votes     = Math.floor(Math.random() * 9999) + 1
    projectId = Math.floor(Math.random() * 9999) + 1

    idea =
      id          : ideaId
      title       : "Test Idea #{ideaId}"
      description : "An idea for project #{projectId} with #{votes} votes!"
      votes       : votes
      project_id  : projectId
