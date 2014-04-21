describe "IdeasViewModel", ->

  beforeEach ->
    spyOn(WinniVote, "IdeaViewModel").andCallFake (idea) -> {target: -> idea}
    
    @ideas   = IdeaFactory.createList 2
    @subject = new WinniVote.IdeasViewModel(@ideas)

  describe "#constructor", ->
    beforeEach -> @actualIdeas = (i.target() for i in @subject.ideas())
      
    it "loads all the ideas", -> expect(@actualIdeas).toEqual(@ideas)
      
    it "is not empty"       , -> expect(@subject.empty()).toBeFalsy()
    
