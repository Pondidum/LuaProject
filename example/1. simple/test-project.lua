local project = require("project")

local testProject = project:new({

	files = {
		"processor.lua",
	},

	run = function(ns)

		local processor = ns.processor.new()

		processor.run()

	end,

}) 

testProject.run()
