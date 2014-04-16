describe "IdeasViewModel", ->

  beforeEach ->
    @ideasJSON = WinniVote.IdeaFactory.getJSONIdeas 20
    @subject   = new WinniVote.IdeasViewModel(@ideasJSON)

  describe "#constructor", ->
    it "has ideas",        ->
      expect(
        {
          id: idea.id()
          title: idea.title()
          description: idea.description()
          votes: idea.votes()
          project_id: idea.project_id()
        } for idea in @subject.ideas()).toEqual(@ideasJSON)
    it "has an empty flag", -> expect(@subject.empty()).toBe(false)