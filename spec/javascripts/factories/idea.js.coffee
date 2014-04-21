class window.IdeaFactory

  @createList: (noOfIdeas) => (@create(i) for i in [1..noOfIdeas])

  @create: (ideaId=1) =>
    votes     = Math.floor(Math.random() * 9999) + 1
    projectId = Math.floor(Math.random() * 9999) + 1

    idea =
      id          : ideaId
      title       : "Test Idea #{ideaId}"
      description : "An idea for project #{projectId} with #{votes} votes!"
      votes       : votes
      project_id  : projectId
