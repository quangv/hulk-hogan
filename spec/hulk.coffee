Describe 'hulk.coffee', ->
	hulk = require '../hulk'

	describe '#compile()', ->
		it 'should be a function', ->
			hulk.compile.should.be.a 'function'
		it 'should return a function', ->
			hulk.compile().should.be.a 'function'

		it 'should compile template', ->
			hulk.compile('Hello {{what}}', {what:'world'})().should.eql 'Hello world'

		describe 'Partials', ->
			fs = require 'fs'
			file = 'test_partial'
			before ->
				fs.writeFileSync file, 'How are you, {{what}}?'

			it 'should include and compile template with {{> filename}} tag.', ->
				hulk.compile("Hello {{what}}. {{> #{file}}}", {what:'world'})().should.eql 'Hello world. How are you, world?'

			after ->
				fs.unlinkSync file
				
			
