Describe 'hulk.coffee', ->
	hulk = require '../hulk'

	describe '#compile()', ->
		it 'should be a function', ->
			hulk.compile.should.be.a 'function'
		it 'should return a function', ->
			hulk.compile().should.be.a 'function'

		it 'should compile template', ->
			hulk.compile('Hello {{what}}', {what:'world'})().should.eql 'Hello world'

		it 'should include partials', ->
			hulk.compile('Hello {{what}}. {{> salute}}', {what:'world'})().should.eql 'Hello world. How are you, world?'
