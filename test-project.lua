require("project")

project:new({

	-- files = {
	-- 	"example\\2. custom-files\\subfile1.lua",
	-- 	"example\\2. custom-files\\subfile2.lua",
	-- },

	files = function()

		return {
			"example\\2. custom-files\\subfile1.lua",
			"example\\2. custom-files\\subfile2.lua",
		}
		
	end,

	run = function(ns)

		print("Hi World")

		print(ns.file1)
		print(ns.file2)

	end,

}) 