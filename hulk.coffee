exports.compile = (source='', options)->
	hogan = require 'hogan.js'
	compiled = hogan.compile source

	require 'log'

	partials = {}
	# Get Partials #
	partial_files = []
	scanned = hogan.scan source
	for item in scanned
		if item.tag is '>'
			partial_files.push item.n

	if partial_files.length
		fs = require 'fs'
		for file in partial_files
			try
				partials[file] = fs.readFileSync(file).toString()  # TODO better way to read file, especially large ones.
			catch e
				if options.defaultEngine
					partials[file] = fs.readFileSync(file+'.'+options.defaultEngine).toString()  # TODO better way to read file, especially large ones.

	return ->
		return compiled.render options, partials
