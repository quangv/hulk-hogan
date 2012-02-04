Feature 'Express Engine',

	"As a developer",
	"I want to use Hulk-Hogan",
	"In order to use Hogan.js with Express", ->

		Scenario "Express 2.x", ->
			Given 'express server', ->
			When 'I set view engine to Hulk-Hogan', ->
			And 'and render a template', ->
			Then 'it should output rendered with Hogan.js'
