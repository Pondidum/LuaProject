require("project")

project:new({

	-- files = {
	-- 	"example\\2. custom-files\\subfile1.lua",
	-- 	"example\\2. custom-files\\subfile2.lua",
	-- },

	-- files = function()

	-- 	return {
	-- 		"example\\2. custom-files\\subfile1.lua",
	-- 		"example\\2. custom-files\\subfile2.lua",
	-- 	}
		
	-- end,

	files = project:io(function(io)

		--io.addFile("example\\2. custom-files\\subfile1.lua")
		io.addFilesIn("example\\2. custom-files")

		-- io.addFilesIn("example\\2. custom-files")
		-- io.addFilesMatching("example\\*\\")
		-- io.addFilesMatching("example\\*.test.lua")

		io.excludeFile("example\\2. custom-files\\custom-files-project.lua")
		-- io.excludeFilesIn("example\\1. simple")
		-- io.excludeFilesMatching("*.test.lua")

	end),

	run = function(ns)

		print("Hi World")

		print(ns.file1)
		print(ns.file2)

	end,

}) 