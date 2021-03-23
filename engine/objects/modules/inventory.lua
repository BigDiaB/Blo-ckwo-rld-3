local Inventory = {layer = 2}

	function Inventory.init(self)
		self.inventory = {
			toggle_timer = 1,
			active = false,
			bulk = {
				{coin = 0,key = 1,{},{},{},},
				{{},{},{},{},{},},
				{{},{},{},{},{},},
				{{},{},{},{},{},},
				{{},{},{},{},{},},
			},
			hotbar = {},
		}
		self.inventory.toggle = function()
			if self.inventory.toggle_timer <= 1 then
				self.inventory.active = not self.inventory.active
				self.inventory.toggle_timer = 10
			end
		end
		Inventory.update = function(dt)
			if self.inventory.toggle_timer > 1 then
				self.inventory.toggle_timer = self.inventory.toggle_timer - (dt * 5)
			end
		end

		Inventory.draw = function()

		end

		ui_render.renderMe(Inventory)
		table.insert(self.updates,Inventory.update)

	end

return Inventory
