Describe 'hulk.coffee', ->
	hulk = require '../hulk'

	describe '#compile()', ->
		it 'should be a function', ->
			hulk.compile.should.be.a 'function'
		it 'should return a function', ->
			hulk.compile().should.be.a 'function'

		it 'should compile template', ->
			hulk.compile('Hello {{what}}', {what:'world'})().should.eql 'Hello world'
