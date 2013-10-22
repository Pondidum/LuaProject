local getFilesToLoad = function(fileEntry)
	
	if fileEntry == nil then
		return {}
	end

	if type(fileEntry) == "function" then
		return fileEntry()
	end

	return fileEntry

end

project = {
	
	new = function(self, config)

		local files = getFilesToLoad(config.files)
		local run = config.run or function() end

		local ns = {}

		for i, filename in ipairs(files) do
			
			local content = loadfile(filename)

			if filename and content then
				content(ns)
			end

		end

		run(ns)

	end,	
}
