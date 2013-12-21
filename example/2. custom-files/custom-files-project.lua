local project = require("project")

local testProject = project:new({

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

testProject.run()