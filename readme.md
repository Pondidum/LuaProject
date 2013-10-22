What is it?
--------------

A small library to make developing large lua projects easier.

Usage
--------------
Add project.lua to your lua path somewhere!

Example
--------------

* the root file of your project:

	```lua
	require("project")

	-- create our new project
	project:new({

		-- one of the methods of defining files to be included
		files = {
			"subfile1.lua",
			"subfile2.lua",
		},

		-- what to do once the files have been loaded.
		run = function(ns)

			print("Hi World")

			print(ns.file1)
			print(ns.file2)

		end,

	}) 
	```

* subfile1.lua
		
	```lua
	local ns = ...
	
	print("Loading file one")
	
	ns.file1 = "I am file one"
	```

* subfile2.lua
		
	```lua
	local ns = ...

	print("Loading file two")

	ns.file2 = "I am file two"
	```

* Produces this output:
	
		Loading file one
		Loading file two
		Hi World
		I am file one
		I am file two
