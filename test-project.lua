require("project")

project:new({

	-- files = {
	-- 	"subfile1.lua",
	-- 	"subfile2.lua",
	-- },

	files = function()

		return {
			"subfile1.lua",
			"subfile2.lua",
		}
		
	end,

	run = function(ns)

		print("Hi World")

		print(ns.file1)
		print(ns.file2)

	end,

}) 