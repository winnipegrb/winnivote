describe "IdeasViewModel", ->

  beforeEach ->
    @ideas = [
      {
        id: 128
        title: "The besy idea ever"
        description: "The best description ever"
        votes: 1024
        project_id: 1337
      },
      {
        id: 129
        title: "The second best idea ever"
        description: "The second best description ever"
        votes: 512
        project_id: 7331
      }
    ]
    @subject = new WinniVote.IdeasViewModel(@ideas)

  describe "#constructor", ->
    it "has ideas",         -> expect({id: idea.id(), title: idea.title(), description: idea.description(), votes: idea.votes(), project_id: idea.project_id() } for idea in @subject.ideas()).toEqual(@ideas)
    it "has an empty flag", -> expect(@subject.empty()).toBe(false)