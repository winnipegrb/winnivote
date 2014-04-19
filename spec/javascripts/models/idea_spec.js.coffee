describe 'Idea', ->
  
  beforeEach ->
    @subject = new WinniVote.Idea
      id: 1
      title: 'Crazy idea'
      description: 'super nice idea'
      votes: 5
      project_id: 33
    
    
  describe '#constructor', ->
    it 'has an id'        , -> expect(@subject.id()).toBe(1)
    it 'has a title'      , -> expect(@subject.title()).toBe('Crazy idea')
    it 'has a description', -> expect(@subject.description()).toBe('super nice idea')
    it 'has votes'        , -> expect(@subject.votes()).toBe(5)
    it 'has a project id' , -> expect(@subject.project_id()).toBe(33)
    
    
  describe '#upvote', ->
    beforeEach ->
      spyOn($, 'ajax')
      @subject.upvote()
      @args = $.ajax.mostRecentCall.args[0]
      
    it "call the upvote api URL", -> expect(@args.url).toBe Routes.upvote_idea_path(1)
    it "uses PUT method"        , -> expect(@args.type).toBe 'put'
    
    describe 'When the call succeeds', ->
      beforeEach -> @args.success(votes: 520)
      
      it "updates the votes in the model", -> expect(@subject.votes()).toBe 520
    
    
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
    