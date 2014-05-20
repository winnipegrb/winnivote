describe 'Idea', ->
  
  beforeEach ->
    @subject = new WinniVote.Idea
      id: 1
      title: 'Crazy idea'
      description: 'super nice idea'
      total_votes: 5
      project_id: 33
    
    
  describe '#constructor', ->
    it 'has an id'        , -> expect(@subject.id()).toBe(1)
    it 'has a title'      , -> expect(@subject.title()).toBe('Crazy idea')
    it 'has a description', -> expect(@subject.description()).toBe('super nice idea')
    it 'has votes'        , -> expect(@subject.total_votes()).toBe(5)
    it 'has a project id' , -> expect(@subject.project_id()).toBe(33)
    
    
  describe '#upvote', ->
    beforeEach ->
      spyOn($, 'ajax')
      @subject.upvote (data) => @data = data
      @args = $.ajax.mostRecentCall.args[0]
      @data = null
      
    it "call the upvote api URL", -> expect(@args.url).toBe Routes.upvote_idea_path(1)
    it "uses PUT method"        , -> expect(@args.type).toBe 'put'
    
    describe 'When the call succeeds and is valid', ->
      beforeEach -> @args.success(total_votes: 520)
      
      it "receives updated vote count in callback", -> expect(@data.total_votes).toBe(520)
      it "does not receive an error",               -> expect(@data.error).toBe(undefined)

    describe 'When the call succeeds but is invalid', ->
      beforeEach -> @args.success(error: "Something went wrong!")

      it "does not receive an updated vote count in callback", ->
        expect(@data.total_votes).toBe(undefined)
      it "receives an error",                                  ->
        expect(@data.error).toBe("Something went wrong!")
    
    
  describe '#update', ->
    beforeEach ->
      spyOn($, 'ajax')
      @subject.update()
      @args = $.ajax.mostRecentCall.args[0]
    
    it "call the upvote api URL", -> expect(@args.url).toBe Routes.idea_path(1)
    it "uses PUT method"        , -> expect(@args.type).toBe 'put'
    it "passes the idea as data", -> 
      expected_data = 
        idea:
          title: 'Crazy idea'
          description: 'super nice idea'
          project_id: 33
          
      expect(@args.data).toEqual expected_data
    