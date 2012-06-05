{join} = require 'path'

exports.parsePartials = (source)->  # Return list of patial filenames in the source.
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

{existsSync} = require 'path'
makePartials = (partials, list, root, defaultEngine)->
	for file in list
		sublist = []
		source = null

		if file not of partials
			filepath = join root, file

			if existsSync filepath
				source = readFile filepath
			else if defaultEngine and existsSync filepath+=".#{defaultEngine}"
				source = readFile filepath

			if source
				partials[file] = source

				sublist = exports.parsePartials source

				if sublist.length
					makePartials partials, sublist, root, defaultEngine
			
	

compile = exports.compile = (source='', options)->
	hogan = require 'hogan.js'
	compiled = hogan.compile source

	partials = {}
	# Get Partials #
	partial_files = exports.parsePartials source

	if partial_files.length
		makePartials partials, partial_files, options.root, options.defaultEngine

	return ->
		return compiled.render options, partials

# add support for Express 3.x templating scheme
# in Express use like this:
#
#		app.engine 'html', hogan.__express
#		app.set 'view engine', 'html'
#
exports.__express = (filename, options, callback) ->
  source = readFile(filename)
 	# pass options to compile method to support partials
  compiled = compile(source, options)
  callback(null, compiled(options))


