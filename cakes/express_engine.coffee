Feature 'Express Engine',

	"In order to use Hulk-Hogan",
	"as a developer",
	"I want to use with Express", ->

		Scenario "Express 2.x", ->
			Given 'express server', ->
			When 'I set view engine to Hulk-Hogan', ->
			And 'and render a template', ->
			Then 'it should output rendered with Hogan.js'
