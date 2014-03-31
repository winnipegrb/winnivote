describe "IdeaViewModel", ->

  beforeEach ->
    @subject = new WinniVote.IdeaViewModel
      id: 128
      title: "The besy idea ever"
      description: "The best description ever"
      votes: 1024
      project_id: 1337

  describe "#constructor", ->
    it "has a project name",    -> expect(@subject.projectName()).toBe(undefined)
    it "has a new title",       -> expect(@subject.newTitle()).toBe(undefined)
    it "has a new description", -> expect(@subject.newDescription()).toBe(undefined)