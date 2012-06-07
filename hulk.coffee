class HulkHogan
	parsePartials : (source)->  # Return list of patial filenames in the source.
		{scan} = require 'hogan.js'
		result = []
		scanned = scan source
		for item in scanned
			if item.tag is '>'
				result.push item.n
		return result

	
	_readFile : (file)->
		{readFileSync} = require 'fs'
		return readFileSync(file).toString() # TODO better way to read file? especially large ones.

	
	_makePartials : (partials, list, root, defaultEngine)->
		{join} = require 'path'
		{existsSync} = require 'path'

		for file in list
			sublist = []
			source = null

			if file not of partials
				filepath = join root, file

				if existsSync filepath
					source = @_readFile filepath
				else if defaultEngine and existsSync filepath+=".#{defaultEngine}"
					source = @_readFile filepath

				if source
					partials[file] = source

					sublist = @parsePartials source

					if sublist.length
						@_makePartials partials, sublist, root, defaultEngine
				
		
	
	compile : (source='', options)->
		hogan = require 'hogan.js'
		compiled = hogan.compile source

		partials = {}
		# Get Partials #
		partial_files = @parsePartials source

		if partial_files.length
			@_makePartials partials, partial_files, options.root, options.defaultEngine

		return ->
			return compiled.render options, partials

	
	__express : (filename, options, callback) ->
		# add support for Express 3.x templating scheme
		# in Express use like this:
		#
		#		app.engine 'html', hogan.__express
		#		app.set 'view engine', 'html'
		#
		source = @_readFile(filename)
		# pass options to compile method to support partials
		compiled = @compile(source, options)
		callback(null, compiled(options))

module.exports = new HulkHogan
