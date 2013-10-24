local lfs = require("lfs")

local getFilesToLoad = function(fileEntry)
	
	if fileEntry == nil then
		return {}
	end

	if type(fileEntry) == "function" then
		return fileEntry()
	end

	return fileEntry

end


local fileHelper = {

	new = function()

		local files = {}
		local this  = {}

		this.addFile = function(path)
			files[path] = true
		end

		this.addFilesIn = function(path)

			for file in lfs.dir(path) do

				local fullPath = path .. "\\" .. file

				if file ~= "." and file ~= ".." and lfs.attributes(fullPath).mode ~= "directory" then
					files[fullPath] = true
				end

			end

		end

		this.excludeFile = function(path)

			if files[path] then
				files[path] = nil
			end
			
		end

		this.excludeFilesMatching = function(expression)

			for path, _ in pairs(files) do
				
				if path:find(expression) then
					files[path] = nil
				end

			end

		end

		this.listFiles = function()
			
			local result = {}

			for path, _ in pairs(files) do
				table.insert(result, path)
			end

			return result

		end

		return this 

	end,
}


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

	io = function(self, action)

		local helper = fileHelper.new()

		action(helper)

		return helper.listFiles()

	end,

}
