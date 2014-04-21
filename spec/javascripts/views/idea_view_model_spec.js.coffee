describe "IdeaViewModel", ->

  beforeEach ->
    @toggler = jasmine.createSpyObj("WinniVote.IdeaToggle", ["toggle"])
    spyOn(WinniVote, "IdeaToggle").andReturn @toggler
    
    @subject = new WinniVote.IdeaViewModel IdeaFactory.create()

  describe "#constructor", ->
    it "has a project name",    -> expect(@subject.projectName()).toBe(undefined)
    it "has a new title",       -> expect(@subject.newTitle()).toBe(undefined)
    it "has a new description", -> expect(@subject.newDescription()).toBe(undefined)

  describe "#edit", ->
    beforeEach -> @subject.edit()
  
    it "should have new title as title",             -> expect(@subject.newTitle()).toBe(@subject.title())
    it "should have new description as description", -> expect(@subject.newDescription()).toBe(@subject.description())
    it "should have toggled to edit mode",           -> expect(@toggler.toggle).toHaveBeenCalled()
  
  describe "#cancel", ->
    beforeEach -> @subject.cancel()
  
    it "should have toggled to content mode", -> expect(@toggler.toggle).toHaveBeenCalled()
  
  describe "#save", ->
    beforeEach ->
      spyOn(@subject, "update")
      @subject.save()
  
    it "should have a title as new title",             -> expect(@subject.title()).toBe(@subject.newTitle())
    it "should have a description as new description", -> expect(@subject.description()).toBe(@subject.newDescription())
    it "should have updated",                          -> expect(@subject.update).toHaveBeenCalled()
    it "should have toggled to content mode",          -> expect(@toggler.toggle).toHaveBeenCalled()
