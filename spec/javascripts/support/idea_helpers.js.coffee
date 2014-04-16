class WinniVote.IdeaHelpers

	@getAttributes: (idea) =>
		ko.mapping.toJS(idea)

	@getAttributesForEach: (ideasArray) =>
		@getAttributes(i) for i in ideasArray
