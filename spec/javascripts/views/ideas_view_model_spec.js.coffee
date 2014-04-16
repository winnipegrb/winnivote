describe "IdeasViewModel", ->

  beforeEach ->
    @ideaAttrsArray = WinniVote.IdeaFactory.attributesArray 2
    @subject        = new WinniVote.IdeasViewModel(@ideaAttrsArray)

  describe "#constructor", ->
    it "has ideas",         -> expect(
        WinniVote.IdeaHelpers.getAttributesForEach(@subject.ideas())
      ).toEqual(@ideaAttrsArray)
    it "has an empty flag", -> expect(@subject.empty()).toBe(false)
