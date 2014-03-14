module IdeaHelpers
  extend Warden::Test::Helpers
  
  def idea_to_hash idea
    {
        title: idea.title,
        description: idea.description
    }
  end
  
end