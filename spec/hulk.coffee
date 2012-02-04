Describe 'hulk.coffee', ->
	hulk = require '../hulk'

	describe '#compile()', ->
		it 'should be a function', ->
			hulk.compile.should.be.a 'function'
		it 'should return a function', ->
			hulk.compile().should.be.a 'function'
