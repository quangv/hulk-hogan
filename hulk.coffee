{join} = require 'path'

getPartials = (source)->  # Return list of patial filenames in the source.
	{scan} = require 'hogan.js'
	result = []
	scanned = scan source
	for item in scanned
		if item.tag is '>'
			result.push item.n
	return result

readFile = (file)->
	{readFileSync} = require 'fs'
	return readFileSync(file).toString() # TODO better way to read file, especially large ones.

exports.compile = (source='', options)->
	hogan = require 'hogan.js'
	compiled = hogan.compile source

	require 'log'

	partials = {}
	# Get Partials #
	partial_files = getPartials source

	if partial_files.length
		{existsSync} = require 'path'
		for file in partial_files
			filepath = join options.root, file

			if existsSync filepath
				partials[file] = readFile filepath
			else if options.defaultEngine and existsSync filepath+=".#{options.defaultEngine}"
				partials[file] = readFile filepath
				
	return ->
		return compiled.render options, partials
