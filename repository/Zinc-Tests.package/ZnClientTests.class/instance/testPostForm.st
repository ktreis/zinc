testing
testPostForm
	| client |
	self withServerDo: [ :server |
		(client := ZnClient new)
			url: server localUrl;
			addPath: 'echo';
			formAt: 'username' put: 'john';
			formAdd: 'password' -> 'secret';
			post.
		self assert: client isSuccess.
		self assert: (client contents includesSubString: 'john').
		self assert: (client contents includesSubString: 'secret') ]