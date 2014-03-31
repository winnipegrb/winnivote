describe "IdeaViewModel", ->

  beforeEach ->
    @subject = new WinniVote.IdeaViewModel
      id: 128
      title: "The best idea ever"
      description: "The best description ever"
      votes: 1024
      project_id: 1337

  describe "#constructor", ->
    it "has a project name",    -> expect(@subject.projectName()).toBe(undefined)
    it "has a new title",       -> expect(@subject.newTitle()).toBe(undefined)
    it "has a new description", -> expect(@subject.newDescription()).toBe(undefined)

  describe "#edit", ->
    beforeEach ->
      @subject.edit()

    it "should have new title as title",             -> expect(@subject.newTitle()).toBe(@subject.title())
    it "should have new description as description", -> expect(@subject.newDescription()).toBe(@subject.description())
    # it "should have toggled to edit mode",           -> expect(@form_vis).toBe(true)