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
      spyOn(@subject, "toggleEditing")
      @subject.edit()

    it "should have new title as title",             -> expect(@subject.newTitle()).toBe(@subject.title())
    it "should have new description as description", -> expect(@subject.newDescription()).toBe(@subject.description())
    it "should have toggled to edit mode",           -> expect(@subject.toggleEditing).toHaveBeenCalledWith("content", "form")

  describe "#cancel", ->
    beforeEach ->
      spyOn(@subject, "toggleEditing")
      @subject.cancel()

    it "should have toggled to content mode", -> expect(@subject.toggleEditing).toHaveBeenCalledWith("form", "content")
  
  describe "#save", ->
    beforeEach ->
      spyOn(@subject, "toggleEditing")
      spyOn(@subject, "update")
      @subject.save()

    it "should have a title as new title",             -> expect(@subject.title()).toBe(@subject.newTitle())
    it "should have a description as new description", -> expect(@subject.description()).toBe(@subject.newDescription())
    it "should have updated",                          -> expect(@subject.update).toHaveBeenCalled()
    it "should have toggled to content mode",          -> expect(@subject.toggleEditing).toHaveBeenCalledWith("form", "content")

  describe "#toggleEditing", ->
    beforeEach ->
      spyOn($.fn, "fadeOut")
      spyOn($.fn, "fadeIn")
      @subject.toggleEditing("from", "to")
      @fadedOut = $.fn.fadeOut.callCount is 1

    it "should toggle", ->
      expect(@fadedOut).toEqual(true)
      # fadeIn never triggered due to invalid $elem target
