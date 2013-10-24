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

		io.addFilesIn("example\\2. custom-files")

		io.excludeFile("example\\2. custom-files\\custom-files-project.lua")
		--io.excludeFilesMatching(".*project.lua")

	end),

	run = function(ns)

		print("Hi World")

		print(ns.file1)
		print(ns.file2)

	end,

}) 