exports.compile = (source, options)->
	hogan = require 'hogan.js'
	compiled = hogan.compile source
	return ->
		return compiled.render options
