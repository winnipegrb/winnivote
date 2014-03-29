# Idea spec
#= require models/idea

describe "Idea", ->
  it "can upvote", ->
    loadFixtures("ideas.slim")
    json  = ideas[0]
    idea  = new WinniVote.Idea(json)
    votes = json["votes"]+1
    idea.upvote()
    expect(idea.votes()).toEqual(votes)