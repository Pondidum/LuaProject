local ns = ...

ns.processor = {

	new = function()

		local this = {}

		this.run = function()
			print("processor.run")
		end

		return this
	end,

}