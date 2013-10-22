What is it?
=====

A small library to make developing large lua projects easier.

Usage
=====
Add project.lua to your lua path somewhere!

Example
=====

Create a file which will act as your root file for your project:

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

Files you include in the project have access to a table (generally called `ns`) passed in, which you can use for common storage:
		
```lua
local ns = ...

print("Loading file one")

ns.file1 = "I am file one"
```

Advanced
=====

files
-----

The `files` node of the project can either be a table with values being file paths, or a function which defines the files:

As a table:

```lua
files = {
	"subfile1.lua",
	"subfile2.lua",
}
```

As a function, you can do anything, as long as you return a table of file names:

```lua
files = function()

	return {
		"subfile1.lua"
	}

end
```

run
-----

The `run` node is optional, and is run after all files have been loaded.  It also has access to the namespace table:

```lua
run = function(ns)

	print("Hi World")

	print(ns.file1)
	print(ns.file2)

end
````

