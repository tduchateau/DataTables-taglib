# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class PathToRoot extends BasePlugin
		# Plugin Name
		name: 'pathToRoot'

		# Parsing all files has finished
		renderBefore: (opts,next) ->
			# Prepare
			docpad = @docpad
			docpad.log 'debug', 'Creating paths to root'
			documents = docpad.getCollection('documents')
			
			# Find documents
			documents.forEach (document) ->
				# Prepare
				documentUrl = document.get('relativePath')
				depth = documentUrl.split('/').length;
				pathToRoot = ['.']
				if depth > 1 
					pathToRoot.push('..') for i in [0..depth-2]
				# console.log documentUrl + ' ' + pathToRoot.join('/')
				document.set('pathToRoot', pathToRoot.join('/'))
			next()?
